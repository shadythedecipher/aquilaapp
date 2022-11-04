import 'package:aquila_android_application/splashscreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1600, 2560),
      builder: (BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aquila land system',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Aquila Eyes Group'),
        home: const SplashScreen(),
        //home: const ProfileUI22(),
        //home: const OpenContainerTransformDemo(),
        // home: const containerDemo(),
        // home: const test2(),
      ),
    );
  }
}
