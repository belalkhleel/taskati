import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final onPreassed;
  final double width;
  Color color = AppColor.primary;
  Color textColor = AppColor.primaryContainer;
  CustomButton({
    required this.onPreassed,
    required this.text,
    this.width = 250,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: ElevatedButton(
        onPressed: onPreassed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
