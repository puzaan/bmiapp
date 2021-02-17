import 'package:bmiapp/ui/home_screen.dart';
import 'package:bmiapp/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        scaffoldBackgroundColor: Color(0xff101539)
      ),
      home: SplashScreen(),
    );
  }
}


