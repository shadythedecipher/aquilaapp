import 'package:flutter/material.dart';

class ProfileUI2 extends StatelessWidget {
  const ProfileUI2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
      Column(
        mainAxisSize: MainAxisSize.min,

       children: [
         Flexible(child: Container(
           decoration: const BoxDecoration(
               image: DecorationImage(
                   image: AssetImage("assets/image/n1.jpg"),
                   fit: BoxFit.cover
               )
           ),
           child: SizedBox(
             width: double.infinity,
             height: 200,
             child: Container(
               alignment: const Alignment(0.0,2.5),
               child:  const CircleAvatar(

               //  backgroundImage:  DecorationImage(image: AssetImage("assets/image/aquila_eyes.png")),
                 radius: 60.0,
               ),
             ),
           ),
         ),
         ),


         const SizedBox(
           height: 60,
         ),

         const Flexible(child:  Text(
           "AQUILA EYES GROUP"
           ,style: TextStyle(
             fontSize: 25.0,
             color:Colors.blueGrey,
             letterSpacing: 2.0,
             fontWeight: FontWeight.w400
         ),
         ),),

         const SizedBox(
           height: 10,
         ),
           const Flexible(child: Text(
           "Tanzania, Morogoro"
           ,style: TextStyle(
             fontSize: 18.0,
             color:Colors.black45,
             letterSpacing: 2.0,
             fontWeight: FontWeight.w300
         ),
         ),),
         const SizedBox(
           height: 10,
         ),
    const Text(
           "Earth Eyes On Every Conner"
           ,style: TextStyle(
             fontSize: 15.0,
             color:Colors.black45,
             letterSpacing: 2.0,
             fontWeight: FontWeight.w300
         ),
         ),
         const SizedBox(
           height: 10,
         ),
    const Flexible(child:  Card(
             margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),

             elevation: 2.0,
             child: Padding(
                 padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                 child: Text("Skill Sets",style: TextStyle(
                     letterSpacing: 2.0,
                     fontWeight: FontWeight.w300
                 ),))
         ),),
         const SizedBox(
           height: 15,
         ),
         const Text(
           "Geospatial analysis| Remote Sensing"
           ,style:  TextStyle(
             fontSize: 18.0,
             color:Colors.black45,
             letterSpacing: 2.0,
             fontWeight: FontWeight.w300
         ),
         ),

         const SizedBox(
           height: 50,
         ),
   Flexible(


     fit: FlexFit.loose,
     child: Row(

           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             RaisedButton(
               onPressed: (){

               },
               shape:  RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(80.0),
               ),
               child: Ink(
                 decoration: BoxDecoration(
                   gradient: const LinearGradient(
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                       colors: [Colors.pink,Colors.redAccent]
                   ),
                   borderRadius: BorderRadius.circular(30.0),

                 ),
                 child: Container(
                   constraints: const BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                   alignment: Alignment.center,
                   child: const Text(
                     "Contact Us",
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 12.0,
                         letterSpacing: 2.0,
                         fontWeight: FontWeight.w300
                     ),
                   ),
                 ),
               ),
             ),
             RaisedButton(
               onPressed: (){

               },
               shape:  RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(80.0),
               ),
               child: Ink(
                 decoration: BoxDecoration(
                   gradient: const LinearGradient(
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                       colors: [Colors.pink,Colors.redAccent]
                   ),
                   borderRadius: BorderRadius.circular(80.0),

                 ),
                 child: Container(
                   constraints: const BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                   alignment: Alignment.center,
                   child: const Text(
                     "Portfolio",
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 12.0,
                         letterSpacing: 2.0,
                         fontWeight: FontWeight.w300
                     ),
                   ),
                 ),
               ),
             )
           ],
         ),),
       ],
     ),
      //  physics: const NeverScrollableScrollPhysics(),
    );

  }
}