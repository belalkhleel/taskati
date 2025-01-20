import 'package:flutter/material.dart';

import '../utils/text_style.dart';

class CustomWidget extends StatelessWidget {
  final Widget widget;
  final String line1,line2;
  const CustomWidget({super.key,required this.widget,required this.line1,required this.line2});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
                fit:  BoxFit.scaleDown,
                child: Text(line1,style: CustomTextStyle.smallTextStyle(),maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: true,)),
            Text(line2,style: CustomTextStyle.bodyTextStyle(),),
          ],
        ),

        widget
      ],
    );
  }
}
