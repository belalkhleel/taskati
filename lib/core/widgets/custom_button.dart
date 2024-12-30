import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

class CustomButton extends StatelessWidget{
  final String text;
  CustomButton({

    required this.text,
});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.primaryContainer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}