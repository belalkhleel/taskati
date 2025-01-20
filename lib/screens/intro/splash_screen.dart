import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/app_const.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/navigator.dart';
import 'package:taskati/screens/home/home_screen.dart';
import 'package:taskati/screens/upload_user_image/upload_user_image.dart';

import '../../core/model/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final userBox=Hive.box<UserModel>(userDB);

  @override
  void initState() {
    userBox.isEmpty?
    Future.delayed(Duration(seconds:5),() => pushWithReplacement(context, page: UploadUserImage()),):
    Future.delayed(Duration(seconds:5),() => pushWithReplacement(context, page: HomeScreen()),);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Lottie.asset('assets/json/splash.json',height: 200,),
            Text("Taskati",style:CustomTextStyle.titleTextStyle(),),
            Text("it's time to get organized!",style: CustomTextStyle.smallTextStyle(),)
          ],
        ),
      ),
    );
  }
}
