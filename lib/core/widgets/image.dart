import 'dart:io';

import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  File? image;
  bool isSmall;
   ImageWidget({super.key, this.image, this.isSmall=false});

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius:isSmall? 40: 70,
      backgroundImage: image != null
          ? FileImage(image!) // Use FileImage for local file
          : NetworkImage(
          "https://cdn-icons-png.flaticon.com/512/149/149071.png"), // Use NetworkImage for URL
    );
  }
}
