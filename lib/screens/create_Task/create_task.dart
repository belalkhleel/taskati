import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/app_bar.dart';
import 'package:taskati/core/widgets/custom_named_text_form_field.dart';

import '../../core/utils/text_style.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

class CreateTask extends StatefulWidget {
  CreateTask({super.key});

  int selectedIndex = 1;

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Create Task",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNamedTextFormField(
                  controller: TextEditingController(),
                  title: "Title",
                  validation: (value) {},
                  hintText: "Enter Title"),
              SizedBox(height: 5,),
              CustomNamedTextFormField(
                  controller: TextEditingController(),
                  maxLines: 5,
                  title: "Note",
                  validation: (value) {},
                  hintText: "Enter Note"),
              SizedBox(height: 5,),

              CustomNamedTextFormField(
                  controller: TextEditingController(),
                  readOnly: true,
                  onTap: () async {
                    await showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                          DateTime
                              .now()
                              .year,
                          DateTime
                              .now()
                              .month,
                          DateTime
                              .now()
                              .day,
                        ),  lastDate: DateTime(3000),);
                  },
                  title: "Date",
                  hintText: "Enter Date"),
              SizedBox(height: 5,),

              Row(
                children: [
                  Expanded(
                    child: CustomNamedTextFormField(
                      controller: TextEditingController(),
                      title: "Start Time",
                      hintText: "Enter Start Time",
                      readOnly: true,
                      onTap: () async {
                        await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                      },
                    ),

                  ),
                  Expanded(
                    child: CustomNamedTextFormField(
                      controller: TextEditingController(),
                      title: "End Time",
                      validation: (value) {},
                      hintText: "Enter End Time",
                      readOnly: true,
                      onTap: () async {
                        await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                      },),

                  ),

                ],

              ),
              SizedBox(height: 15,),

              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.selectedIndex = 1;
                      });
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColor.tertiary,
                      child: widget.selectedIndex == 1 ? Icon(
                        Icons.check, color: AppColor.white,) : SizedBox(),
                    ),
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.selectedIndex = 2;
                      });
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColor.orange,
                      child: widget.selectedIndex == 2 ? Icon(
                        Icons.check, color: AppColor.white,) : SizedBox(),
                    ),
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.selectedIndex = 3;
                      });
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColor.red,
                      child: widget.selectedIndex == 3 ? Icon(
                        Icons.check, color: AppColor.white,) : SizedBox(),
                    ),
                  ),
                  Spacer(),
                  CustomButton(onPreassed: (){},text: "Create Task",width: 150,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
