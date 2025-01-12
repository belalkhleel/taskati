import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({required String title})
      : super(
          title: Text(title),
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.primaryContainer,
        );
}
