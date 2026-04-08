# Daily Fact Notification System

## Overview

The app sends a daily push notification containing a short fact from `assets/json/daily_facts.json`. Facts are selected based on the user's interests from their personalization profile. When the user taps the notification, a detail dialog is shown in-app with the full fact content. The system tracks which facts have already been shown so the user never sees the same fact twice until the pool is exhausted.

---

## File Responsibilities

| File | Role |
|---|---|
| `lib/notifications/data/daily_fact.dart` | Data model — `DailyFact` with id, push body, full body, interests |
| `lib/notifications/notification/app_notification.dart` | Base sealed class — `AppNotification`, payload serialization |
| `lib/notifications/notification/daily_fact_notification.dart` | Notification model — wraps `DailyFact` with scheduled time |
| `lib/notifications/domain/daily_fact_repository.dart` | Repository interface — `factForToday`, `factShown` |
| `lib/notifications/data/daily_fact_repository_impl.dart` | Repository impl — fact selection logic, shown-history tracking |
| `lib/notifications/notification_service.dart` | OS integration — schedules/cancels via `flutter_local_notifications` |
| `lib/notifications/notification_cubit.dart` | State management — enables/disables, sets time, applies settings |
| `lib/notifications/notification_cubit_state.dart` | State model — enabled, hour, minute, isLoading, permissionDenied |
| `lib/notifications/data/notification_settings_local_source.dart` | Persistence — SharedPreferences keys for notification settings |
| `lib/notifications/notification_tap_dispatcher.dart` | Tap routing — routes notification payload to in-app dialog |
| `lib/presentation/notifications/daily_fact_dialog.dart` | UI — full-body fact dialog shown on notification tap |
| `assets/json/daily_facts.json` | Content — array of all available facts |

---

## Data Model

### `DailyFact`

```json
{
  "id": "fact_001",
  "pushBody": "Short text shown in the push notification.",
  "fullBody": "Longer explanation shown in the in-app dialog.",
  "interests": ["cars", "money"]
}
```

| Field | Description |
|---|---|
| `id` | Unique string identifier, used to track shown history |
| `pushBody` | Short text shown in the OS push notification |
| `fullBody` | Long-form text shown in `DailyFactDialog` |
| `interests` | Tags used to match facts to user interests |

The `title` getter builds the notification title: `"Daily fact · Cars"` (first interest, capitalized). Falls back to `"Daily fact"` if interests are empty.

---

## Fact Selection Logic

`DailyFactRepositoryImpl.factForToday(interests)` selects which fact to schedule:

1. **Interest pool** — filters all facts to those matching at least one of the user's interests. If no interests are provided, uses all facts.
2. **Fallback to all facts** — if no facts match the user's interests, uses the full facts list.
3. **Unseen filter** — removes facts whose ids are in the `daily_facts.shown_ids` SharedPreferences key.
4. **Global unseen fallback** — if every fact in the interest pool has been seen, looks for any unseen fact globally (across all interests).
5. **Full reset** — if every single fact in the database has been seen, clears the shown history and resets to the interest-based pool, so the cycle restarts.
6. **Random pick** — selects one fact at random from the final unseen pool.

The selected fact is returned as a `DailyFactNotification` scheduled for **09:00** (overridden by the user's saved time in `_applySettings`).

### Tracking shown facts

After the user taps and views a notification, `DailyFactRepository.factShown(factId)` is called, which appends the fact id to the `daily_facts.shown_ids` JSON list in SharedPreferences.

---

## Scheduling Flow

### On user action (enable / change time)

1. `NotificationCubit.setEnabled(true)`:
   - Requests OS permission via `NotificationService.requestPermissions()`.
   - If denied, emits `permissionDenied: true` and stops.
   - If granted, persists `enabled = true` and calls `_applySettings()`.
2. `NotificationCubit.setTime(hour, minute)`:
   - Persists new time via `NotificationSettingsRepository`.
   - Calls `_applySettings()` if currently enabled.
3. `_applySettings()`:
   - Loads current settings.
   - If enabled: calls `DailyFactRepository.factForToday(interests)` to pick a fact, then calls `NotificationService.scheduleDaily(notif)` with the saved hour/minute.
   - If disabled: calls `NotificationService.cancel()`.

### `NotificationService.scheduleDaily(notif)`

- Cancels all existing scheduled notifications.
- Resolves the device's local timezone via `flutter_native_timezone_latest`.
- Computes the next occurrence of `notif.hour:notif.minute` in local time (moves to next day if the time has already passed today).
- Schedules via `FlutterLocalNotificationsPlugin.zonedSchedule` with `matchDateTimeComponents: time` — this repeats daily at the same time automatically.
- The full `DailyFactNotification` is JSON-encoded and stored as the notification **payload**.

> **Note:** Only one notification id (`0`) is used. Every reschedule cancels the previous one first.

### Default time

The default notification time is **09:00** (set in `NotificationCubitState` defaults and `NotificationSettingsLocalSource` fallbacks).

---

## Notification Tap Handling

Taps are routed through `NotificationTapDispatcher` (singleton):

- **App in foreground / background:** `onNotificationTap` callback → `NotificationTapDispatcher.instance.handle(payload)`.
- **App launched from notification (cold start):** `main()` calls `notificationService.getNotificationResponseAppLaunch()` and passes the payload to `NotificationTapDispatcher.instance.savePendingPayload()`. The payload is replayed once the router attaches via `attachRouter()`.
- **Background isolate tap:** `onBackgroundNotificationTap` saves the payload as pending; it is replayed when the router attaches.

`_handlePayload()` decodes the JSON payload, reconstructs a `DailyFactNotification`, and calls `router.showAppDialog(DailyFactDialog(fact: ...))`. When the dialog closes, `DailyFactRepository.factShown(factId)` is called to mark the fact as seen.

---

## What Happens When the User Skips a Notification

If the user dismisses (swipes away) a notification without tapping it:

- No tap handler fires — `factShown()` is **never called**.
- The fact is **not** marked as seen in SharedPreferences.
- Because the notification is scheduled with `matchDateTimeComponents: time`, the OS repeats it daily using the **same baked-in payload** — i.e. the same fact fires again the next day.
- This repeats indefinitely until `_applySettings()` is called again, which only happens when the user changes their notification settings (toggle or time change). At that point a new fact is picked and rescheduled.

> **Known gap:** There is no dismiss callback registered (`onDidReceiveDismissNotificationResponse` is not wired up in `NotificationService`), and there is no "reschedule on app launch" logic. The shown-history only advances when the user actually opens the dialog.

---

## In-App Dialog (`DailyFactDialog`)

Shown when the user taps the notification. Displays:

- **Header** — ember gradient icon badge + "Daily Fact" title.
- **Interest tags** — all interests listed as `• INTEREST` labels in ember color.
- **Push body** — short subtitle in muted text.
- **Full body** — scrollable content card (max height 280) with the long-form explanation.
- **"Got it" button** — dismisses the dialog.
- **Close (×) button** — top-right corner, also dismisses.

Supports light and dark mode with gradient backgrounds.

---

## Settings Persistence

All settings are stored in SharedPreferences:

| Key | Type | Default | Description |
|---|---|---|---|
| `notifications.enabled` | bool | `false` | Whether daily notifications are active |
| `notifications.hour` | int | `9` | Scheduled hour (0–23) |
| `notifications.minute` | int | `0` | Scheduled minute (0–59) |
| `notifications.permission_dialog_shown` | bool | `false` | Whether the permission prompt has been shown |
| `daily_facts.shown_ids` | JSON string | `[]` | List of fact ids already shown to the user |

### Permission recovery

If the user denied permission but later enables it in system Settings, `NotificationCubit.refreshPermissionStatus()` (called on app resume) detects the grant, auto-enables notifications, and reschedules without requiring the user to tap again.

---

## Adding New Facts

Edit `assets/json/daily_facts.json` and add entries following this format:

```json
{
  "id": "fact_099",
  "pushBody": "Short push notification text (1–2 sentences).",
  "fullBody": "The longer explanation shown in the in-app dialog.",
  "interests": ["interest_tag_1", "interest_tag_2"]
}
```

- `id` must be unique across all facts.
- `interests` values should match the tags used in the user personalization quiz so facts are correctly matched to user profiles.
- No app rebuild is required if the asset is already bundled; for existing installs the updated JSON takes effect on next launch.
