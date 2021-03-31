import 'package:flutter/material.dart';

class NewActivity extends StatefulWidget {


  @override
    _NewActivityState createState() => _NewActivityState();
}

class _NewActivityState extends State<NewActivity>{
  String valueChoose;
  List listPriority = [
    "Urgente - Importante", 'No Urgente - Importante', 'Urgente - No Importante', 'No Urgente - No Importante'
  ];

  String valueChoose2;
  List listCategory = [
    'Profesional', 'Social', 'Salud', 'Familia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Actividad'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Nombre de la Actividad:'),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5)
                ),
                child: DropdownButton(
                  hint: Text('Seleccione nivel de prioridad'),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  underline: SizedBox(),
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState((){
                      valueChoose = newValue;
                    });
                  },
                  items: listPriority.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: DropdownButton(
                  hint: Text('Seleccione Categoría'),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  underline: SizedBox(),
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  value: valueChoose2,
                  onChanged: (newValue) {
                    setState((){
                      valueChoose2 = newValue;
                    });
                  },
                  items: listCategory.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),

              TextField(
                decoration: InputDecoration(labelText: 'Añadir Nota...'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
