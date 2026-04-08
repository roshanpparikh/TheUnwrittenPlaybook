enum UserBehaviourEvent {
  sessionStart("SESSION_START"),
  sessionEnd("SESSION_END"),
  pressedProfile("PRESSED_PROFILE"),
  pressedPray("PRESSED_PRAY"),
  pressedIndividualTab("PRESSED_INDIVIDUAL_TAB"),
  pressedGroupTab("PRESSED_GROUP_TAB"),
  pressedAddPrayer("PRESSED_ADD_PRAYER"),
  pressedSchedule("PRESSED_SCHEDULE"),
  pressedPrayerArchive("PRESSED_PRAYER_ARCHIVE"),
  pressedStudyArchive("PRESSED_STUDY_ARCHIVE"),
  pressedCreateGroup("PRESSED_CREATE_GROUP"),
  pressedGroupInvite("PRESSED_GROUP_INVITE"),
  pressedEditProfile("PRESSED_EDIT_PROFILE");

  const UserBehaviourEvent(this._name);
  final String _name;

  @override
  String toString() => _name;
}
