import 'package:flutter/material.dart';
import 'package:trashcare/Page.dart';
import 'package:trashcare/camera.dart';
import 'package:trashcare/halaman_home.dart';
import 'package:trashcare/rootpage.dart';
import 'package:trashcare/splash.dart';


void main(){
  runApp (MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}