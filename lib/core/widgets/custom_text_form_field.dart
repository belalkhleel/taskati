import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  String? Function(String?)? validation;
  final void Function()? onTap;
  final int? maxLines;

  final KeyboardType;
  String? hintText;
  final bool readOnly;
  IconData? icon;

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

  CustomTextFormField.icon(
      {super.key,
      this.readOnly = false,
      this.maxLines,
      this.validation,
      this.hintText,
      required this.controller,
      this.KeyboardType = TextInputType.text,
      this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      maxLines: maxLines,
      keyboardType: KeyboardType,
      controller: controller,
      validator: validation,
      decoration: InputDecoration(
        suffixIcon: icon==null?null:Icon(icon,color: AppColor.primary,),
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
