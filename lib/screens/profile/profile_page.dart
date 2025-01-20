import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/app_const.dart';
import 'package:taskati/core/model/user.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/TaskeWidget.dart';
import 'package:taskati/core/widgets/app_bar.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';

import '../../core/model/task.dart';
import '../../core/widgets/custom_named_text_form_field.dart';
import '../../core/widgets/image.dart';
import '../../features/imag_picker_logic.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userBox = Hive.box<UserModel>(userDB);

  void ShowBottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: widget,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: userBox.listenable(),
      builder: (ctx, box, child) {
        UserModel? user = box.get('user');
        return user == null
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBarWidget(title: '${user.name} Profile'),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              ShowBottomSheet(
                                context,
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ListTile(
                                          title: Text('chose from gallery'),
                                          onTap: () async {
                                            Navigator.pop(context);

                                            final image =
                                                await pickImageFromGallery();
                                            if (image == null) {
                                            } else {
                                              userBox.put(
                                                  'user',
                                                  UserModel.onChangePhoto(
                                                      user, image.path));
                                            }
                                          },
                                        ),
                                        Divider(),
                                        ListTile(
                                          title: Text('chose from Camera'),
                                          onTap: () async {
                                            Navigator.pop(context);
                                            final image =
                                                await pickImageFromCamera();
                                            if (image == null) {
                                            } else {
                                              userBox.put(
                                                  'user',
                                                  UserModel.onChangePhoto(
                                                      user, image.path));
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: ImageWidget(image: user.image)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          user.name,
                          style: CustomTextStyle.bodyTextStyle(),
                        ),
                        CustomButton(
                            onPreassed: () {
                              final nameController =
                                  TextEditingController(text: user.name);
                              final formKey = GlobalKey<FormState>();
                              ShowBottomSheet(
                                context,
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Form(
                                    key: formKey,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            CustomNamedTextFormField(
                                                controller: nameController,
                                                title: "Name",
                                                validation: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter name";
                                                  }
                                                  return null;
                                                },
                                                hintText: "Enter name"),
                                            SizedBox(height: 20),
                                            CustomButton(
                                                onPreassed: () {
                                                  if (formKey.currentState!.validate()) {
                                                    userBox.put('user', UserModel.onchangeName(user,nameController.text));
                                                    Navigator.pop(context);

                                                  }
                                                },
                                                text: 'change the name'),


                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            text: 'change name'),
                        SizedBox(height: 20,),
                        Text('Completed Tasks',style: CustomTextStyle.smallTextStyle(),),
                        ValueListenableBuilder(valueListenable: Hive.box<Task>(completedTaskDB).listenable(),
                            builder: (context, value, child) {
                              List<Task> completedTaskes=value.values.toList();
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: completedTaskes.length,
                                  itemBuilder:(context, index) {
                                  
                                  return TaskWidget(task: completedTaskes[index]);
                                },),
                              );
                            },)

                      ],
                    ),
                  ),
                ));
      },
    );
  }
}
