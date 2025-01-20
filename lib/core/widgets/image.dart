import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

class ImageWidget extends StatelessWidget {
  String? image;
  bool isSmall;
   ImageWidget({super.key, this.image, this.isSmall=false});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar (
      backgroundColor: AppColor.primary,
      radius:isSmall? 47: 77,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius:isSmall? 43: 73,
        child: CircleAvatar(
          radius:isSmall? 40: 70,
          backgroundImage: image != null
              ? FileImage(File(image!)) // Use FileImage for local file
              : NetworkImage(
              "https://cdn-icons-png.flaticon.com/512/149/149071.png"), // Use NetworkImage for URL
        ),
      ),
    );
  }
}
