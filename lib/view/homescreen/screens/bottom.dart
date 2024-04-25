import 'package:flutter/material.dart';
import 'package:sugar/model/color/dart%20color.dart';
import 'package:sugar/view/homescreen/screens/HomeScreen2.dart';
import 'package:sugar/view/homescreen/screens/homescreen.dart';
import 'package:sugar/view/homescreen/screens/profile.dart';
import 'package:sugar/view/homescreen/screens/supplies.dart';


class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int currentIndex = 4;
  List<Widget>Screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen2(),
    Supplies(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],
      bottomNavigationBar :BottomNavigationBar(
        selectedItemColor: AppColor.purplecolor,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        onTap: (value){
          setState(() {
            currentIndex = value;
          },
          );
        },
        items: [

          BottomNavigationBarItem(

            icon: Icon(Icons.home_filled,
            ),
            label: 'Home',
            activeIcon: Column(
              children: [
                Icon(Icons.home,),
                SizedBox(height: 1,),
                CircleAvatar(
                  radius: 2,
                  backgroundColor: AppColor.purplecolor,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.camera_alt_outlined,
            ),
            label: 'Camera Scan',
            activeIcon: Column(
              children: [
                Icon(Icons.camera_alt_outlined,),
                SizedBox(height: 1,),
                CircleAvatar(
                  radius: 2,
                  backgroundColor: AppColor.purplecolor,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(

            icon: Image(image:AssetImage("assets/im/subblies.png"),
              height: 30,
              width: 30,
            ),
            label: 'Add',
            activeIcon: Column(
              children: [
                Image(image:AssetImage("assets/im/subblies.png"),
                  height: 30,
                  width: 30,
                ),
                SizedBox(height: 1,),
                CircleAvatar(
                  radius: 2,
                  backgroundColor: AppColor.purplecolor,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(

            icon: Image(image:AssetImage("assets/im/Accessibility.png"),
              height: 30,
              width: 30,
            ),
            label: 'Help',
            activeIcon: Column(
              children: [
                Image(image:AssetImage("assets/im/Accessibility.png"),
                  height: 30,
                  width: 30,
                ),
                SizedBox(height: 1,),
                CircleAvatar(
                  radius: 2,
                  backgroundColor: AppColor.purplecolor,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.person,
            ),
            label: 'Profile',
            activeIcon: Column(
              children: [
                Icon(Icons.person,),
                SizedBox(height: 1,),
                CircleAvatar(
                  radius: 2,
                  backgroundColor: AppColor.purplecolor,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
