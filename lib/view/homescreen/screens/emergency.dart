import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sugar/view/1screens/loginscreens/signupcubit/auth_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import '../../../model/color/dart color.dart';
import '../cubit/addnewemergency/ActionButton.dart';
import '../cubit/addnewemergency/DescCubit.dart';
import '../cubit/addnewemergency/DescState.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.h,),
            Text("Emergency Contacts",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: const EdgeInsets.only(
                  left: 13.0,
                  right: 10
              ),
              child: Text("Contacts you add here will be automatically contacted in case of emergency. You can delete or edit any contact by swiping them left :",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            BlocConsumer<DescCubit,DescState>(
              builder: (context, state) {
                var cubit = DescCubit.get(context);
                return ListView.separated(
                  padding: EdgeInsets.all(10),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MaterialButton(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          side: BorderSide(color: Colors.black),
                        ),
                        height: 60,
                      color: AppColor.purplecolor,

                      onPressed: () async{
                        final link = WhatsAppUnilink(
                          phoneNumber: '2${cubit.emergency[index].number}',
                          text: "${AuthCubit.get(context).nameController.text} is in bad condition due to diabetes , You are receiving this message because ${AuthCubit.get(context).nameController.text} has listed you as an emergency contact.",
                        );
                        await launchUrl(Uri.parse('$link'));
                      },
                      child: Column(

                        children: [
                          SizedBox(height: 5.h,),
                          Text(
                            cubit.emergency[index].name,
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5.h,),
                          Text(
                            "+2${cubit.emergency[index].number}",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                  separatorBuilder:  (context, index) => SizedBox(height: 10.h,),
                 itemCount: cubit.emergency.length,
                );
              },
              listener: (context, state) {

              },
            ),
            Expanded(child: SizedBox(height: 5.h,)),
            ActionButton(),
            SizedBox(height: 15.h,),


          ],
        ),
      ),
    );
  }

}
