import 'package:flutter/material.dart';



import 'package:yodapp/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:yodapp/services/auth.dart';
import 'package:yodapp/models/user.dart';
import 'package:yodapp/shared/splashScreen.dart';


// test

  // This widget is the root of your application.
// This widget is the root of your application.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: SplashScreen(),
      ),

    );
  }
}


//class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  /*void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

