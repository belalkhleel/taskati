import 'package:flutter/material.dart';

import '../utils/text_style.dart';

class CustomWidget extends StatelessWidget {
  final Widget widget;
  final String line1,line2;
  const CustomWidget({super.key,required this.widget,required this.line1,required this.line2});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(line1,style: CustomTextStyle.smallTextStyle(),),
            Text(line2,style: CustomTextStyle.bodyTextStyle(),),
          ],
        ),
        Spacer(),
        widget
      ],
    );
  }
}
