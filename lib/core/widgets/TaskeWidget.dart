import 'package:flutter/material.dart';

import '../model/task.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: task.level==Level.red?AppColor.red:task.level==Level.yellow?AppColor.orange:AppColor.primary,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                task.title,
                style: CustomTextStyle.smallTextStyle(
                  color: AppColor.primaryContainer,
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: AppColor.primaryContainer,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '${task.startTime.format(context)} - ${task.endTime.format(context)}',
                    style: CustomTextStyle.smallTextStyle(
                      color: AppColor.primaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 2,
            height: 60,
            color: AppColor.primaryContainer,
            margin: EdgeInsets.symmetric(vertical: 10), ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'TODO',
              style: CustomTextStyle.smallTextStyle(
                color: AppColor.primaryContainer,
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
