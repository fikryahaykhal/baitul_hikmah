import 'package:flutter/material.dart';
import 'package:sik_baitulhikmah/widgets/text_widget.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.text,
      required this.color,
      required this.textColor,
      required this.onTap});

  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
      onPressed: onTap,
      child: TextWidget(
        text: text,
        textsize: 14,
        fontWeight: FontWeight.w600,
        textcolor: textColor,
      ),
    );
  }
}
