import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/core/widgets/image.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/date_format.dart';
import '../../core/widgets/TaskeWidget.dart';
import '../../core/widgets/custom_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              CustomWidget(
                line1: 'Hello, Test User',
                line2: 'Welcome to Taskati',
                widget: ImageWidget(isSmall: true,),),
              SizedBox(height: 15,),
              CustomWidget(
                line1:dateFormat(DateTime.now()),
                line2: 'Today',
                widget: CustomButton.icon(onPreassed:(){} , text: 'Add Task',width: 150,icon: Icons.add,),),
              SizedBox(height: 15,),

              DatePicker(
                DateTime.now(),
                height: 100,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColor.primary,
                selectedTextColor: AppColor.primaryContainer,
                onDateChange: (date) {
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
              SizedBox(height: 15,),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                  return TaskWidget();

                  },),
              )
            ],
          ),
        ),

      ),
    );
  }
}


