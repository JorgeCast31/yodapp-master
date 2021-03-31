import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
final int index;

DetailPage(this.index);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Actividad'),
      ),
      body: Center(
        child: Text('Detalles de la actividad $index'),
      ),
    );
  }
}