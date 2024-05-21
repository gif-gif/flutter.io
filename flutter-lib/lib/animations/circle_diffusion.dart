import 'package:flutter/material.dart';

class CircleDiffusionEffect extends StatefulWidget {
  static const String routeName = '/circleDiffusion';
  final double startRadius;
  final double endRadius;
  final int color;
  final double strokeWidth;
  final int duration; //ms
  final int interval; //ms

  final double size; // 主要定位用：控制整个画布大小。动画以中心点开始扩散

  final Widget? child;

  const CircleDiffusionEffect({
    super.key,
    required this.startRadius,
    required this.endRadius,
    required this.color,
    required this.strokeWidth,
    required this.duration,
    required this.interval,
    required this.size,
    this.child,
  });
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CircleDiffusionEffect(
        startRadius: 50,
        endRadius: 100,
        color: 0xFF1FE7F5,
        strokeWidth: 2,
        duration: 700,
        interval: 1500,
        size: 100,
      ),
    );
  }

  @override
  _CircleDiffusionEffectState createState() => _CircleDiffusionEffectState();
}

class _CircleDiffusionEffectState extends State<CircleDiffusionEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double lowerBound;
  @override
  void initState() {
    super.initState();
    lowerBound = widget.startRadius / widget.endRadius;
    _controller = AnimationController(
      lowerBound: lowerBound,
      upperBound: 1,
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    )..forward();

    _controller.addListener(() async {
      // print(_controller.status);
      if (_controller.isCompleted) {
        await Future.delayed(Duration(milliseconds: widget.interval));
        _controller.forward(from: lowerBound);
      } else if (_controller.isDismissed) {
        // await Future.delayed(Duration(seconds: 3));
        // _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter:
              _MyPainter(_controller.value * widget.endRadius, widget.color, widget.strokeWidth, _controller.value),
          child: SizedBox(
            // decoration: BoxDecoration(color: Palette.colorC),
            width: widget.size,
            height: widget.size,
            child: Center(
              child: widget.child,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void rePlay(BuildContext context) {
    _controller.forward(from: lowerBound);
  }
}

class _MyPainter extends CustomPainter {
  final double radius;
  final int color;
  final double strokeWidth;
  final double value;
  _MyPainter(this.radius, this.color, this.strokeWidth, this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(color).withAlpha((255 - (value * 255).round()).clamp(0, 255).toInt())
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(_MyPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
