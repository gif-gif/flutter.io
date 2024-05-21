import 'dart:math';

import 'package:flutter/material.dart';

class RotatingCircleEffect extends StatefulWidget {
  static const String routeName = '/RotatingCircle';
  final double radius;
  final double strokeWidth;
  final int duration;
  final int color;

  final double size;

  const RotatingCircleEffect(
      {super.key,
      required this.radius,
      required this.duration,
      required this.strokeWidth,
      required this.color,
      required this.size});

  static Route route() {
    //for test
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RotatingCircleEffect(
        radius: 50,
        duration: 700,
        strokeWidth: 3,
        color: 0xFF0000FF,
        size: 100,
      ),
    );
  }

  @override
  _RotatingCircleEffectState createState() => _RotatingCircleEffectState();
}

class _RotatingCircleEffectState extends State<RotatingCircleEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CirclePainter(_controller, widget.radius, widget.strokeWidth, widget.color),
      child: SizedBox(
        // decoration: BoxDecoration(color: Palette.colorC),
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Animation<double> animation;
  final double radius;
  final double strokeWidth;
  final int color;
  _CirclePainter(this.animation, this.radius, this.strokeWidth, this.color) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;

    final center = Offset(size.width / 2, size.height / 2);

    final angle = 2 * pi * animation.value;
    const tailLength = 1; // Tail length as a fraction of the full circle
    const step = 0.01;
    for (double i = 0; i < 1; i += step) {
      final alpha = ((1 - i) * 255).toInt();
      paint.color = Color(color).withAlpha(alpha);
      final startAngle = angle - 2 * pi * i * tailLength;
      final endAngle = startAngle + 2 * pi * step;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        endAngle - startAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
