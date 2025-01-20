import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/widgets/image.dart';
import 'package:taskati/features/navigator.dart';
import 'package:taskati/screens/home/home_screen.dart';

import '../../app_const.dart';
import '../../core/model/user.dart';
import '../../features/imag_picker_logic.dart';

class UploadUserImage extends StatefulWidget {
  UploadUserImage({super.key});

  @override
  State<UploadUserImage> createState() => _UploadUserImageState();
}

class _UploadUserImageState extends State<UploadUserImage> {
  final nameController = TextEditingController();
  final uploadScreenKey = GlobalKey<FormState>();
  String? image;

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
                    UserModel user =
                        UserModel(name: nameController.text, image: image!);
                    Hive.box<UserModel>(userDB).put('user', user);
                    pushAndRemoveUntil(context, page: HomeScreen());
                  } else {
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
                onPreassed: () {
                 pickImageFromGallery().then((val){
                   if (val == null) {
                   } else {
                     image = val.path;
                   }
                   setState(() {

                   });

                 });
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Upload Image from camera",
                onPreassed: () {
                  pickImageFromCamera().then((val) {
                    if (val == null) {
                    } else {
                      image = val.path;
                    }
                    setState(() {

                    });

                  });
                },
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
                    controller: nameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your name";
                      } else if (!RegExp('^[A-z][a-z]{2,8}').hasMatch(value)) {
                        return 'Name must start with a capital letter and be at least 3 characters';
                      } else {
                        return null;
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
