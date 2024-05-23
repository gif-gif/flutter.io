import 'package:flutter/cupertino.dart';

/// 渐变颜色文本控件
///
/// ```dart
///GradientText(
///      'Gradient Text',
///       gradient: LinearGradient(
///         colors: [
///           Color(0xFFFEF38F),
///           Color(0xFFE28346),
///         ],
///         begin: Alignment.centerLeft,
///         end: Alignment.centerRight,
///       ),
///       style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
///     )
///
///```
///
class GradientText extends StatelessWidget {
  GradientText(
    this.text, {
    required this.gradient,
    required this.style,
  });

  /// 文本
  final String text;

  /// 样式
  final TextStyle style;

  /// 渐变样式
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
