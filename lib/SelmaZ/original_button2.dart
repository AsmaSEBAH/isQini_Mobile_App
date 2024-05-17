import 'package:flutter/material.dart';

class OriginalButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final Color textColor;
  final Color bgColor;
  const OriginalButton2({Key? key, required this.text, required this.onpressed, required this.textColor, required this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 28,
      width: size.width * 0.6,
      child: RaisedButton(
        color: bgColor,
        onPressed: onpressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
      ),
    );
  }
}
