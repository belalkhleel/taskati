import 'package:flutter/material.dart';
import 'package:taskati/screens/intro/splash_screen.dart';

import 'screens/upload_user_image/upload_user_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  UploadUserImage(),
    );
  }
}

