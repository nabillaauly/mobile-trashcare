import 'package:flutter/material.dart';
import 'package:trashcare/camera.dart';
import 'package:trashcare/constants.dart';
import 'package:trashcare/datasampah.dart';
import 'package:trashcare/chatbot.dart';
import 'package:trashcare/halaman_home.dart';
import 'package:trashcare/profile_page.dart';
import 'package:trashcare/splash.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootPage extends StatefulWidget {
    const RootPage({Key? key}) :super(key: key);

   @override
  State<RootPage> createState() => _RootPage();
}

class _RootPage extends State<RootPage> {
  int _bottomNavIndex = 0;
  List<Widget> pages = const [
    HalamanPage(),
    chatbot(),
    DataSampah(),
    ProfilePage(),
   
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.recycling,
    Icons.dataset,
    Icons.person
  ];

  List<String> titleList =[
    'Home',
    'ChatBot',
    'Data',
    'Profile'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24
            ),),
            Icon(Icons.notifications, color: Constants.blackColor, size: 30.0,)

          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageTransition(child: Camera(), type: PageTransitionType.bottomToTop));
        },
        child: Image.asset('images/camera.png', height: 30.0,),
        backgroundColor: Constants.primaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap:(index){
            setState(() {
              _bottomNavIndex = index;
            });
          } 
        ),
    );
  }
}