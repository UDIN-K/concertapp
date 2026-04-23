import 'package:flutter/material.dart';
import 'dart:math' as math;

// Re-export theme
export 'flutter_flow_theme.dart';

/// Animation mode for the shader gradient
enum ShaderAnimationMode { continuous, once, disabled }

/// Container for shader parameters (colors + values)
class ShaderParams {
  final Map<String, dynamic> values;
  final Map<String, Color> colors;

  const ShaderParams({
    this.values = const {},
    this.colors = const {},
  });
}

/// Custom animated gradient fill — replaces FlutterFlow's FbmGradientShaderFill
/// which requires their proprietary runtime.
///
/// Creates a smooth, organic-looking animated gradient using multiple
/// overlapping radial gradients that move in circular orbits.
class FbmGradientShaderFill extends StatefulWidget {
  final double width;
  final double height;
  final ShaderParams params;
  final ShaderAnimationMode animationMode;
  final bool cache;

  const FbmGradientShaderFill({
    super.key,
    required this.width,
    required this.height,
    required this.params,
    this.animationMode = ShaderAnimationMode.continuous,
    this.cache = false,
  });

  @override
  State<FbmGradientShaderFill> createState() => _FbmGradientShaderFillState();
}

class _FbmGradientShaderFillState extends State<FbmGradientShaderFill>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );
    if (widget.animationMode == ShaderAnimationMode.continuous) {
      _controller.repeat();
    } else if (widget.animationMode == ShaderAnimationMode.once) {
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
    // Extract visible colors
    final allColors = widget.params.colors.values.toList();
    final visibleColors = allColors.where((c) => c.a > 0).toList();

    if (visibleColors.length < 2) {
      return Container(
        width: widget.width,
        height: widget.height,
        color: visibleColors.isNotEmpty ? visibleColors.first : Colors.black,
      );
    }

    // Pick primary colors for the gradient orbs
    final baseColor = visibleColors[0];
    final accentColor1 = visibleColors.length > 1 ? visibleColors[1] : baseColor;
    final accentColor2 = visibleColors.length > 2 ? visibleColors[2] : accentColor1;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value * 2.0 * math.pi;
        return ClipRect(
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: CustomPaint(
              painter: _GradientPainter(
                t: t,
                baseColor: baseColor,
                accentColor1: accentColor1,
                accentColor2: accentColor2,
              ),
              size: Size(widget.width, widget.height),
            ),
          ),
        );
      },
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double t;
  final Color baseColor;
  final Color accentColor1;
  final Color accentColor2;

  _GradientPainter({
    required this.t,
    required this.baseColor,
    required this.accentColor1,
    required this.accentColor2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Fill with base color
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = baseColor,
    );

    // Animated radial gradient orb 1
    _drawOrb(
      canvas, size,
      cx: 0.3 + 0.2 * math.cos(t),
      cy: 0.4 + 0.2 * math.sin(t * 0.7),
      radius: 0.6,
      color: accentColor1.withValues(alpha: 0.4),
    );

    // Animated radial gradient orb 2
    _drawOrb(
      canvas, size,
      cx: 0.7 + 0.15 * math.sin(t * 1.3),
      cy: 0.6 + 0.15 * math.cos(t * 0.9),
      radius: 0.5,
      color: accentColor2.withValues(alpha: 0.35),
    );

    // Smaller accent orb 3
    _drawOrb(
      canvas, size,
      cx: 0.5 + 0.25 * math.cos(t * 0.5 + 1.5),
      cy: 0.3 + 0.2 * math.sin(t * 1.1 + 0.8),
      radius: 0.35,
      color: accentColor1.withValues(alpha: 0.2),
    );
  }

  void _drawOrb(Canvas canvas, Size size, {
    required double cx,
    required double cy,
    required double radius,
    required Color color,
  }) {
    final center = Offset(cx * size.width, cy * size.height);
    final r = radius * math.max(size.width, size.height);

    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color, color.withValues(alpha: 0)],
        stops: const [0.0, 1.0],
      ).createShader(
        Rect.fromCircle(center: center, radius: r),
      );

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(_GradientPainter oldDelegate) => t != oldDelegate.t;
}
