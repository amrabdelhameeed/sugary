import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class Visible extends StatelessWidget {
  const Visible({super.key, required this.picture, required this.on, this.status});
  final dynamic picture;
  final dynamic status;

  final void Function() on;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: status ,
      replacement: CircleAvatar(
        child: Image.file(
          File(
            picture ?? "",
          ),
          fit: BoxFit.cover,
          height: 80.h,
          width: 60.w,
        ),
      ),
      child: InkWell(
        onTap: () async {
          await Permission.photos.request();
          var status = await Permission.photos.status;
          if (status == PermissionStatus.granted) {
            on();
          } else {
            await Permission.photos.request();
          }
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              child: Padding(
                padding:  EdgeInsets.all(10.sp),
                child: Image.asset("assets/im/Gallery.png",),
              ),
              radius: 50.sp,

            ),
            SizedBox(height: 20.h,),

            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.add,
                color: Colors.black,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
