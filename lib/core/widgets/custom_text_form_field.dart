import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  String? Function(String?)? validation;
  final void Function()? onTap;
  final int? maxLines;

  final KeyboardType;
  String? hintText;
  final bool readOnly;

  final TextEditingController controller;

  CustomTextFormField(
      {super.key,
        this.readOnly = false,
       this.maxLines,
      this.validation,
      this.hintText,
      required this.controller,
      this.KeyboardType = TextInputType.text,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly:readOnly ,
      maxLines: maxLines,
      keyboardType: KeyboardType,
      controller: controller,
      validator: validation,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.error),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
