import 'dart:async';

import 'package:flutter/material.dart';

/// 圖片載入時的骨架屏，使用 shimmer 提升 loading 感知。
class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    super.key,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.showIcon = false,
    this.shimmerTimeout = const Duration(seconds: 5),
  });

  final double height;
  final BorderRadius borderRadius;
  final bool showIcon;
  final Duration shimmerTimeout;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _ShimmerBox(
              borderRadius: borderRadius,
              shimmerTimeout: shimmerTimeout,
            ),
            if (showIcon)
              Center(
                child: Icon(
                  Icons.image_outlined,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ShimmerBox extends StatefulWidget {
  const _ShimmerBox({required this.borderRadius, required this.shimmerTimeout});

  final BorderRadius borderRadius;
  final Duration shimmerTimeout;

  @override
  State<_ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<_ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _timeoutTimer;
  bool _animate = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();

    _timeoutTimer = Timer(widget.shimmerTimeout, () {
      if (!mounted) {
        return;
      }

      setState(() {
        _animate = false;
      });
      _controller.stop();
    });
  }

  @override
  void dispose() {
    _timeoutTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark
        ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.72)
        : colorScheme.surfaceContainerHighest;
    final highlightColor = isDark
        ? Colors.white.withValues(alpha: 0.18)
        : Colors.white.withValues(alpha: 0.45);

    final child = DecoratedBox(
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: widget.borderRadius,
      ),
    );

    if (!_animate) {
      return child;
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (rect) {
            final offset = _controller.value * 2 - 1;
            return LinearGradient(
              begin: Alignment(-1.2 + offset, 0),
              end: Alignment(1.2 + offset, 0),
              colors: [baseColor, highlightColor, baseColor],
              stops: const [0.35, 0.5, 0.65],
            ).createShader(rect);
          },
          child: child,
        );
      },
    );
  }
}
