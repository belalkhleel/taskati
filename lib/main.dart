import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/app_const.dart';
import 'package:taskati/core/model/task.dart';
import 'package:taskati/core/model/user.dart';
import 'package:taskati/screens/create_Task/create_task.dart';
import 'package:taskati/screens/home/home_screen.dart';
import 'package:taskati/screens/intro/splash_screen.dart';

import 'core/adapter/task_adapter.dart';
import 'core/adapter/user_adapter.dart';
import 'screens/upload_user_image/upload_user_image.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(UserAdapter());

  await Hive.openBox<UserModel>(userDB);
  await Hive.openBox<Task>(taskDB);
  await Hive.openBox<Task>(completedTaskDB);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  SplashScreen(),
    );
  }
}

