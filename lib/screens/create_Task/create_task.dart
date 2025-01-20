import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/app_const.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/date_format.dart';
import 'package:taskati/core/widgets/app_bar.dart';
import 'package:taskati/core/widgets/custom_named_text_form_field.dart';
import 'package:taskati/features/navigator.dart';
import 'package:taskati/screens/home/home_screen.dart';

import '../../core/model/task.dart';
import '../../core/utils/text_style.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

class CreateTask extends StatefulWidget {
  CreateTask({super.key});

  int selectedIndex = 0;

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Create Task",
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNamedTextFormField(
                    controller: titleController,
                    title: "Title",
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "Please enter title";
                      }
                      return null;
                    },
                    hintText: "Enter Title"),
                SizedBox(
                  height: 5,
                ),
                CustomNamedTextFormField(
                    controller: noteController,
                    maxLines: 5,
                    title: "Note",
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "Please enter note";
                      } else if (value.length < 10) {
                        return "Note must be at least 10 characters";
                      }
                      return null;
                    },
                    hintText: "Enter Note"),
                SizedBox(
                  height: 5,
                ),
                CustomNamedTextFormField.icon(
                    icon: Icons.calendar_month_rounded,
                    controller: dateController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                        ),
                        lastDate: DateTime(3000),
                        confirmText: "Confirm",
                        cancelText: "Cancel",
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                          dateController.text = dateFormat(pickedDate);
                        });
                      }
                    },
                    validation: (value) {
                      if (selectedDate == null) return "Please select date";
                      return null;
                    },
                    title: "Date",
                    hintText: "Enter Date"),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomNamedTextFormField.icon(
                        icon: Icons.access_time_rounded,
                        controller: startTimeController,
                        title: "Start Time",
                        hintText: "Start Time",
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? startPickdTime = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (startPickdTime != null) {
                            startTime = startPickdTime;
                            startTimeController.text =
                                startPickdTime.format(context).toString();
                          }
                        },
                        validation: (value) {
                          if (startTime == null)
                            return "Please select start time";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomNamedTextFormField.icon(
                        icon: Icons.access_time_rounded,
                        controller: endTimeController,
                        title: "End Time",
                        validation: (value) {
                          if (endTime == null) {
                            return "Please select end time";
                          }
                          return null;
                        },
                        hintText: "End Time",
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? endPickdTime = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (endPickdTime != null) {
                            endTime = endPickdTime;
                            endTimeController.text =
                                endPickdTime.format(context).toString();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.selectedIndex = 0;
                        });
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColor.primary,
                        child: widget.selectedIndex == 0
                            ? Icon(
                                Icons.check,
                                color: AppColor.white,
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.selectedIndex = 1;
                        });
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColor.orange,
                        child: widget.selectedIndex == 1
                            ? Icon(
                                Icons.check,
                                color: AppColor.white,
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.selectedIndex = 2;
                        });
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColor.red,
                        child: widget.selectedIndex == 2
                            ? Icon(
                                Icons.check,
                                color: AppColor.white,
                              )
                            : SizedBox(),
                      ),
                    ),
                    Spacer(),
                    CustomButton(
                      onPreassed: () {
                        if (formKey.currentState!.validate()) {
                          if(startTime!.isAfter(endTime!)){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Start time must be before end time")));}
                          else{
                            Task newTask = Task(
                                id: DateTime.now().microsecond.toString(),
                                title: titleController.text,
                                note: noteController.text,
                                date: selectedDate!,
                                startTime: startTime!,
                                endTime: endTime!,
                                level: Level.values[widget.selectedIndex],
                                isCompleted: false);
                            print('here');
                            var taskBox = Hive.box<Task>(taskDB);

                            taskBox.put(newTask.id, newTask);
                            push(context, page: HomeScreen());
                          }
                        }
                      },
                      text: "Create Task",
                      width: 150,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
