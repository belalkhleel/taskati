import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: AppColor.primary,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                'Flutter Task ',
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
                    '10:00 AM - 11:00 AM',
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
