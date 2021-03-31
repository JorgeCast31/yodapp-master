import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:yodapp/screens/wrapper.dart';


class SplashScreen extends StatelessWidget {

  Widget build(BuildContext context){

    return MaterialApp(
        //debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
        splash: Center(
          child: Container(
            alignment: Alignment.center,
            height: 200.0,
            width: 200.0,
            margin: EdgeInsets.all(10.0),
            child: Image.asset(
              'Images/logo2.png',
              fit:BoxFit.fill,
            ),
          ),

        ),


          nextScreen: Wrapper(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        duration: 1500,
      ),

    );
  }
}