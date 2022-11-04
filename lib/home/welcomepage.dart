import 'package:aquila_android_application/listofcountries/regions.dart';
import 'package:aquila_android_application/maindashboard/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../shapeloader/shapedat4.dart';

class WelcomePage extends StatefulWidget{
  const WelcomePage({Key? key}) : super(key: key);



  @override
  State<StatefulWidget> createState() =>_WelcomePage();


}

class _WelcomePage extends State<WelcomePage>{
  get child => null;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
       body: SafeArea(
         child: Container(
         constraints: const BoxConstraints.expand(),
           decoration: const BoxDecoration(
           image: DecorationImage(
               image: AssetImage("assets/image/lgn8.png"),
              fit: BoxFit.cover),
         ),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.end,
             children: [

               SizedBox(

                 child: Center(
                   child: Column(
                     children: [
                       Row(
                         children: [
                           const Padding(padding: EdgeInsets.all(20)),
                           const SizedBox(width: 50,
                             height: 60,
                           ),
                            Flexible(child:  Text(
                             "we observe earth for the benefit of everything",
                             softWrap: true,
                             style: GoogleFonts.lato(fontSize: 30,color: const Color.fromRGBO(21,4,111,100),fontWeight: FontWeight.bold),
                           ),),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
                const SizedBox(
                  height: 30,
                ),
               ElevatedButton(

                   style: ElevatedButton.styleFrom(
                     primary: const Color(0xFF096770),
                   ),
                   // onPressed: ()=>Get.to(const MyHomePage(title: "Arial Hebrew")),
                 //
                   onPressed: ()=>Get.to(const MyHomePage(title: "home") ),
                   // onPressed: ()=>Get.to(const ListOfRegions(),),
                   child: Column(
                     children: [
                     SizedBox(
                       width: 250,
                       height: 40,
                         child: Center(
                           child: Text("welcome",
                             style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
                           ),
                         )
                     )
                     ],
                   )
               ),
                const SizedBox(
                  height: 5,
                ),
             ],
           ),
       )
         )
     );

  }
}