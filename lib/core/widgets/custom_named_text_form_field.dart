import 'package:flutter/material.dart';

import '../utils/text_style.dart';
import 'custom_text_form_field.dart';

class CustomNamedTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final bool readOnly;
  final void Function()? onTap;
  final TextInputType KeyboardType;
  final String? hintText;
  final int? maxLines;
  String? Function(String?)? validation;

  CustomNamedTextFormField({
    super.key,
    this.readOnly = false,
    this.onTap,
    this.KeyboardType = TextInputType.text,
    required this.controller,
    required this.title,
    this.maxLines,
    this.validation,
    this.hintText,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyle.bodyTextStyle(),
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          readOnly: readOnly,
          onTap: onTap,
          KeyboardType: KeyboardType,
          maxLines: maxLines,
          controller: controller,
          validation: validation,
          hintText: hintText,

        ),
      ],
    );
  }
}
