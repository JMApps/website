import 'package:flutter/cupertino.dart';

class TextAppDescription extends StatelessWidget {
  const TextAppDescription({
    super.key,
    required this.appDescription,
    required this.fontSize,
  });

  final String appDescription;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      appDescription,
      style: TextStyle(
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}
