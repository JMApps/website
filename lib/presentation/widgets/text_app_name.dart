import 'package:flutter/cupertino.dart';

class TextAppName extends StatelessWidget {
  const TextAppName({
    super.key,
    required this.appName,
    required this.fontSize,
  });


  final String appName;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      appName,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
