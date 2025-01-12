import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final onPreassed;
  final double width;
  Color color = AppColor.primary;
  Color textColor = AppColor.primaryContainer;
  IconData? icon;

  CustomButton({
    required this.onPreassed,
    required this.text,
    this.width = 250,
  });

  CustomButton.icon(
      {required this.onPreassed, required this.text, this.width = 250,this.icon}) {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: icon==null?ElevatedButton(
        onPressed: onPreassed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ):ElevatedButton.icon(
        onPressed: onPreassed,
        label: Text(text),
        icon: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
