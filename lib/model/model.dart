import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MOdelProgress extends StatelessWidget {
  const MOdelProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final size = 300.0;
    const TWO_PI = 3.14 * 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A0944),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 30.sp,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                // Move.move(context, MOdelProgress2());
              },
              icon: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 30.sp,
                color: Colors.white,
              )),
        ],
        centerTitle: true,
        title: Text(
          "Plugged",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color(0xFF2A0944),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Center(
              child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 0.75),
                  duration: Duration(seconds: 4),
                  builder: (context, value, child) {
                    // percentage to show in Center Text
                    int percentage = (value * 100).ceil();
                    return Container(
                      width: size,
                      height: size,
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return SweepGradient(
                                startAngle: 0.0,
                                endAngle: TWO_PI,
                                stops: [value, value], // value from Tween Animation Builder
                                // 0.0 , 0.5 , 0.5 , 1.0
                                center: Alignment.center,

                                colors: [
                                  Color(0xFFF9BF58),
                                  Color(0xFF2A0944),
                                ],
                              ).createShader(rect);
                            },
                            child: Container(
                              width: size,
                              height: size,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFF9BF58),
                                    Color(0xFF2A0944),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: size - 40,
                              height: size - 40,
                              decoration: BoxDecoration(color: Color(0xFF2A0944), shape: BoxShape.circle),
                              child: Container(
                                width: size,
                                height: size,
                                decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: Image.asset("assets/im/progress.png").image)),
                                child: Center(
                                  child: Text(
                                    "$percentage",
                                    style: TextStyle(fontSize: 35.sp, color: Colors.orange, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Start Time : ",
                            style: TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "2024-02-29 - 07:42",
                          style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "End Time : ",
                            style: TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "ITC Station",
                          style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Duration : ",
                            style: TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "45 Min",
                          style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Charger type :",
                            style: TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "DC",
                          style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Connector type : ",
                            style: TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "GB / T Standard",
                          style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Status : ",
                            style: TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Chargin",
                          style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF9BF58),
                  fixedSize: Size(280.w, 40.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/im/Vector.png"),
                      height: 30,
                      width: 30,
                    ),
                    Text(
                      "Stop",
                      style: TextStyle(color: Colors.black, fontSize: 20.sp),
                    ),
                    Image(
                      image: AssetImage("assets/im/Vector (1).png"),
                      height: 30,
                      width: 30,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
