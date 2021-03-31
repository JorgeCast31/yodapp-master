import 'package:flutter/material.dart';
import 'package:yodapp/services/auth.dart';
import 'package:yodapp/services/auth.dart';
import 'package:yodapp/screens/home/ListPage.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context){
    return Scaffold(
     body: MyHomePage(),

    );

  }
}


