import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({required String title,List<Widget> actions=const []})
      : super(
          title: Text(title),
          actions: actions,
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.primaryContainer,
        );
}
