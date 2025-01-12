import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/widgets/image.dart';
import 'package:taskati/features/navigator.dart';
import 'package:taskati/screens/home/home_screen.dart';

class UploadUserImage extends StatefulWidget {
  UploadUserImage({super.key});

  @override
  State<UploadUserImage> createState() => _UploadUserImageState();
}

class _UploadUserImageState extends State<UploadUserImage> {
  final uploadScreenKey = GlobalKey<FormState>();
  File? image;
  final ImagePicker picker = ImagePicker();

  void pickImageFromGallery() async {
// Pick an image.
    final XFile? _image = await picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      image = File(_image.path);
      setState(() {});
    }
  }

  void pickImageFromCamera() async {
// Pick an image.
    final XFile? _image = await picker.pickImage(source: ImageSource.camera);
    if (_image != null) {
      image = File(_image.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: uploadScreenKey,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  if (uploadScreenKey.currentState!.validate() &&
                      image != null) {
                    pushAndRemoveUntil(context, page: HomeScreen());
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please upload an image")));
                  }
                },
                child: Text("Done"))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             ImageWidget(image: image),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Upload Image from gallery",
                onPreassed: pickImageFromGallery,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Upload Image from camera",
                onPreassed: pickImageFromCamera,
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                color: AppColor.primary,
                thickness: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomTextFormField(
                  controller: TextEditingController(),
                  validation:  (value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                    else if(!RegExp('^[A-z][a-z]{2,8}').hasMatch(value)){
                      return  'Name must start with a capital letter and be at least 3 characters';
                    }else {
                      return null;
                    }
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
