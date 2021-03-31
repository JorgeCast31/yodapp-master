import 'package:flutter/material.dart';
import 'package:yodapp/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:yodapp/models/user.dart';
import 'package:yodapp/screens/home/home.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    final user = Provider.of<User>(context);
    print(user);

    if (user == null){
      return Authenticate();

    }else{
      return Home();
    }
  }
}