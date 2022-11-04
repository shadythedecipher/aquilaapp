import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUI22 extends StatelessWidget {
  const ProfileUI22({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: Container(
              height: 700.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/n1.jpg"),
                      fit: BoxFit.cover,
                  )
              ),
              child: SizedBox(
                width: double.infinity,
                height: 500.h,
                child: Container(
                  alignment: const Alignment(0.0,2.5),
                  child:  CircleAvatar(
                  //  backgroundImage: const NetworkImage('https://unsplash.com/photos/R81KIAKokN4'),
                    radius: 200.0.r,
                  ),
                ),
              ),
            ),
            ),


            SizedBox(
              height: 300.h,
            ),

             Flexible(child:  Text(
              "AQUILA EYES GROUP"
              ,style: TextStyle(
                fontSize: 130.0.sp,
                color:Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w800
            ),
            ),),

               SizedBox(
              height: 30.h,
            ),
             Flexible(child: Text(
              "Tanzania, Morogoro"
              ,style: TextStyle(
                fontSize: 100.0.sp,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w600,
            ),
            ),),
            SizedBox(
              height: 30.h,
            ),
              Text(
              "Earth Eyes On Every Conner"
              ,style: TextStyle(
                fontSize: 50.0.sp,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w600
            ),
            ),
                SizedBox(
              height: 30.sp,
            ),
            Flexible(child:  Card(
                margin: EdgeInsets.symmetric(horizontal: 70.0.w,vertical: 70.0.h),
                elevation: 2.0,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 30.w),
                    child: Text("Skill Sets",style: TextStyle(
                      fontSize: 55.sp,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w500
                    ),))
            ),),
             SizedBox(
              height: 30.h,
            ),
             Text(
              "Geospatial analysis| Remote Sensing"
              ,style:  TextStyle(
                fontSize: 50.0.sp,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w500
            ),
            ),

              SizedBox(
              height: 150.h,
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
                      borderRadius: BorderRadius.circular(80.0.r),
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
                        constraints:  BoxConstraints(maxWidth: 500.0.w,maxHeight: 100.h,),
                        alignment: Alignment.center,
                        child:  Text(
                          "Contact Us",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0.sp,
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
                        constraints:  BoxConstraints(maxWidth: 500.0.w,maxHeight: 100.h,),
                        alignment: Alignment.center,
                        child:  Text(
                          "Portfolio",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0.sp,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        //  physics: const NeverScrollableScrollPhysics(),
      ),
    );

  }
}