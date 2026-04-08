import 'dart:math';
import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/tip_model.dart';
import '../../../core/theme/colors.dart';
import 'shimmer.dart';

class TipCard extends StatefulWidget {
  final TipModel tip;
  final Duration delay;
  final bool isOpened;

  const TipCard({
    super.key,
    required this.tip,
    this.delay = Duration.zero,
    this.isOpened = false,
  });

  @override
  State<TipCard> createState() => _TipCardState();
}

class _TipCardState extends State<TipCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
      value: widget.isOpened ? 1.0 : 0.0,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _onTap() {
    if (_controller.isAnimating) return;
    // if (_controller.status == AnimationStatus.completed) {
    //   _controller.reverse();
    // } else
      if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, _) {
          final value = _rotationAnimation.value;
          final isFrontStep = value <= pi / 2;

          return ShimmerLoading(
            isLoading: isFrontStep,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(value),
              child: isFrontStep
                  ? _buildSide(isCover: true)
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(pi),
                      child: _buildSide(isCover: false),
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSide({required bool isCover}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCover ? const Color(0x402D5BFF) : const Color(0x252D5BFF),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isCover
              ? const [Color(0x302D5BFF), Color(0x182D5BFF)]
              : const [Color(0x1A2D5BFF), Color(0x0DFF6B35)],
        ),
      ),
      // The Stack ensures the container is always as large as the longest content
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 1. "Ghost" Content: Always here, but invisible during Cover state
          // This forces the Container to the correct size.
          Opacity(opacity: isCover ? 0 : 1, child: _buildMainContent()),

          // 2. Cover Label: Only visible during Cover state
          if (isCover)
            Text(
              widget.tip.type.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 4,
                color: ember,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.tip.label.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: ember,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.tip.content,
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.8),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
