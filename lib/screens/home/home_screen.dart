import 'dart:io';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati/app_const.dart';
import 'package:taskati/core/model/user.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/core/widgets/image.dart';
import 'package:taskati/features/navigator.dart';
import 'package:taskati/screens/create_Task/create_task.dart';

import '../../core/model/task.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/date_format.dart';
import '../../core/widgets/TaskeWidget.dart';
import '../../core/widgets/custom_widget.dart';
import '../profile/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _selectedValue ;
  final taskBox=Hive.box<Task>(taskDB);
  final userBox=Hive.box<UserModel>(userDB);

  @override
  void initState() {
     super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              ValueListenableBuilder(

                valueListenable: userBox.listenable(),
                builder: (context, value, child) {
                  final user=value.get('user');
                  return CustomWidget(
                    line1: 'Hello, ${user!.name}',
                    line2: 'Welcome to Taskati',
                    widget: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          push(context, page: ProfilePage());
                        },
                        child: ImageWidget(
                          image: user.image,
                          isSmall: true,
                        ),
                      ),
                    ),
                  );

                }

              ),
              SizedBox(
                height: 15,
              ),
              CustomWidget(
                line1: dateFormat(DateTime.now()),
                line2: 'Today',
                widget: CustomButton.icon(
                  onPreassed: () {
                    push(context, page: CreateTask());
                  },
                  text: 'Add Task',
                  width: 150,
                  icon: Icons.add,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              DatePicker(
                DateTime.now(),

                height: 100,
                //initialSelectedDate: DateTime.now(),
                selectionColor: AppColor.primary,
                selectedTextColor: AppColor.primaryContainer,
                onDateChange: (date) {
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: taskBox.listenable(),

                  builder: (context, value, child) {
                    final taskBox = Hive.box<Task>(taskDB);
                    final completedTaskBox=Hive.box<Task>(completedTaskDB);
                    List<Task> tasks=[];
                    if(_selectedValue==null){
                      tasks.addAll(taskBox.values.toList());

                    }
                    else{
                      tasks.addAll(taskBox.values.toList().where((element) => element.date==_selectedValue,));

                    }
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Dismissible(

                          onDismissed: (direction) {
                            if(direction==DismissDirection.startToEnd){
                              completedTaskBox.put(tasks[index].id, Task.onComplete(tasks[index]));
                              taskBox.delete(tasks[index].id);
                            }
                            else{
                              taskBox.delete(tasks[index].id);
                            }
                          },
                            background: Container(
                              decoration:
                              BoxDecoration(
                                color: AppColor.green,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("complete",style: CustomTextStyle.smallTextStyle(fontSize:18,color: AppColor.primaryContainer,),),
                                  ],
                                ),
                              ),
                            ),
                            secondaryBackground: Container(
                              decoration:
                              BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                  color: AppColor.red
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Delete",style: CustomTextStyle.smallTextStyle(fontSize:18,color: AppColor.primaryContainer,),),
                                  ],
                                ),
                              ),
                            ),
                            key: UniqueKey(),
                            child: TaskWidget(
                              task: tasks[index],
                            ));
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
