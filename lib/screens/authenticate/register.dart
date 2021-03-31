import 'package:flutter/material.dart';
import 'package:yodapp/services/auth.dart';

class Register extends StatefulWidget{

  final Function toggleView;
  Register({ this.toggleView});

  @override
  _RegisterState createState() => _RegisterState ();

}

class _RegisterState extends State<Register>{

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password='';
  String error = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Inicio de Sesion'),
              onPressed: () {
                widget.toggleView();
              }
          )
        ],
      ),

      body: Container (
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          // ignore: deprecated_member_use
          child: Form(
            key: _formKey,
              child: ListView (
                  children: <Widget> [
                    SizedBox( height: 200.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email ',



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
                    SizedBox(height: 30.0) ,
                    RaisedButton(
                        color: Colors.black,
                        child: Text(
                          'Registrarse',
                          style: TextStyle(color: Colors.white),
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




          )

      ),

    );
  }
}