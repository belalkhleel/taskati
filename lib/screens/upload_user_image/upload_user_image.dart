import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/custom_button.dart';

class UploadUserImage extends StatelessWidget {
  const UploadUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
            ),

            SizedBox(
              height: 20,
            ),
            CustomButton(text:"Upload Image",),
            SizedBox(
              height: 20,
            ),
            CustomButton(text:"Upload Image",),

          ],
        ),
      ),
    );
  }
}

