import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/theme/colors.dart';
import 'package:upwork_the_unwritten_playbook/presentation/widgets/OptionalScrollWidget.dart';

class AppScaffold extends StatelessWidget {
  final bool showGradientBackground;
  final Widget body;
  final String title;
  final EdgeInsets? bodyPadding;
  final bool scrolling;
  final Color? lightBg;
  final List<Widget>? appBarActions;
  final bool? resizeToAvoidBottomInset;
  final Widget? leading;

  const AppScaffold({
    super.key,
    this.showGradientBackground = true,
    required this.body,
    this.title = "",
    this.bodyPadding,
    this.scrolling = true,
    this.lightBg,
    this.appBarActions = const [],
    this.resizeToAvoidBottomInset,
    this.leading
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final decoration = showGradientBackground
        ? BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark ? const [navy, slate] : const [lightBg1, lightBg2],
            ),
          )
        : null;

    final hasAppBar = title.isNotEmpty;
    Widget bodyWidget = Padding(
      padding: bodyPadding ?? const EdgeInsets.all(16),
      child: body,
    );
    bodyWidget = scrolling ? OptionalScrollWidget(child: bodyWidget) : bodyWidget;

    return Scaffold(
      backgroundColor: isDark ? Theme.of(context).scaffoldBackgroundColor : (lightBg ?? Theme.of(context).scaffoldBackgroundColor),
      extendBodyBehindAppBar: showGradientBackground && hasAppBar,
      extendBody: true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: hasAppBar
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              surfaceTintColor: Colors.transparent,
              actions: appBarActions,
              leading: leading,
              title: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Fraunces',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                  height: 1.2,
                ),
              ),
            )
          : null,
      body: Container(
        height: double.infinity,
        decoration: decoration,
        child: hasAppBar
            ? Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + kToolbarHeight,
                ),
                child: bodyWidget,
              )
            : bodyWidget,
      ),
    );
  }
}
