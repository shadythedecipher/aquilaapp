import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/welcomepage.dart';


class SplashScreen extends StatefulWidget{
   const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_SplashState();


}

class _SplashState extends State<SplashScreen>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(begin:Alignment.topRight,
          end: Alignment.bottomRight , colors: [Colors.white, Colors.white38],
          ),


        ) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            Image.asset("assets/image/aquila_eyes.png",
              height: 350,
              width: 300,
            ),
            // const Text(
            //   "AQUILA EYES APP",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     color: Color.fromRGBO(18, 168, 157, 50),
            //     fontWeight: FontWeight.bold,
            //     fontSize: 50,
            //
            //   ),
            // ),
            const CircularProgressIndicator(color: Color(0xFF096770),),
          ],
        ),
      ),

    );
  }

  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 3),()=>Get.to(const MyHomePage(title: 'home page',)));
    Timer(const Duration(seconds: 3),()=>Get.to(const WelcomePage()));

  }
}