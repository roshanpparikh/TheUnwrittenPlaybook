import 'package:flutter/widgets.dart';

class OptionalScrollWidget extends StatefulWidget {
  final Widget child;
  final ScrollPhysics scrollPhysicsWhenScrollable;
  final ScrollPhysics scrollPhysicsWhenNotScrollable;
  final EdgeInsetsGeometry? padding;

  const OptionalScrollWidget({
    super.key,
    required this.child,
    this.padding,
    this.scrollPhysicsWhenScrollable = const BouncingScrollPhysics(),
    this.scrollPhysicsWhenNotScrollable = const NeverScrollableScrollPhysics(),
  });

  @override
  State<OptionalScrollWidget> createState() => _OptionalScrollWidgetState();
}

class _OptionalScrollWidgetState extends State<OptionalScrollWidget> {
  final _scrollController = ScrollController();
  bool _canScroll = false;
  bool _scheduled = false;

  @override
  void initState() {
    super.initState();
    _scheduleRecalc();
  }

  @override
  void didUpdateWidget(covariant OptionalScrollWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Child might change size/content
    _scheduleRecalc();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scheduleRecalc() {
    if (_scheduled) return;
    _scheduled = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scheduled = false;
      _recalcScrollable();
    });
  }

  void _recalcScrollable() {
    if (!mounted) return;
    if (!_scrollController.hasClients) {
      // try again next frame when attached
      _scheduleRecalc();
      return;
    }

    final canScrollNow = _scrollController.position.maxScrollExtent > 0;
    if (canScrollNow != _canScroll) {
      setState(() => _canScroll = canScrollNow);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Re-check after layout if something (keyboard/orientation) changes
    _scheduleRecalc();

    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (_) {
        _scheduleRecalc();
        return false;
      },
      child: SizeChangedLayoutNotifier(
        child: CustomScrollView(
          controller: _scrollController,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: _canScroll
              ? widget.scrollPhysicsWhenScrollable
              : widget.scrollPhysicsWhenNotScrollable,
          slivers: [
            SliverPadding(
              padding: widget.padding ?? EdgeInsets.zero,
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}