import 'package:flutter/material.dart';
import 'package:yodapp/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView});

  @override
  _SignInState createState () => _SignInState();

}

class _SignInState extends State<SignIn>{

  final AuthService  _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text introduciton

  String email = '';
  String password='';
  String error = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,

          body: Container (
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              // ignore: deprecated_member_use
              child: Form(
                key: _formKey,
                child: ListView (
                  children: <Widget> [

                    SizedBox(height: 100.0,),
                  Image.asset(
                      'Images/logo2.png',
                      height: 250.0,
                  ),




                   SizedBox( height: 75.0),
                   TextFormField(
                    decoration: InputDecoration(
                    hintText: 'Email or Username',



              ),
                  validator: (val) => val.isEmpty ? 'Introduzca su email' : null,
                     onChanged: (val){

                  setState(()  => email = val );



              },
              ),

                  SizedBox( height: 20.0),
                  TextFormField(
                  decoration: InputDecoration(
                  hintText: 'Password',



              ),

                  obscureText: true,
                 validator: (val) => val.length < 6 ? 'Introduzca mas de 6 caracteres' : null,

                 onChanged: (val){

                   setState(()  => password = val );

              },
              ),
                   SizedBox(height: 30.0),
                   RaisedButton(
                   color: Colors.black,
                   child: Text(
                  'Iniciar Sesion',
                  style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                  if (_formKey.currentState.validate()){
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  if (result == null){
                  setState (() => error = 'Introduzca correctamente los datos');
                  }
                  }
                  }

                    ),

                    SizedBox(height: 30.0),
                    FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text(
                    '¿No tienes cuenta? Registrate',
                    style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                    if (_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                    setState(() => error = 'porfavor introduzca bien su correo'); {

                    }
                    }

                    }
                    }
                    ),


                    SizedBox(height:  12.0),
                    Text (
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0 ),
                    )
                    ]
                    )
      ),








          )



    );

  }
}