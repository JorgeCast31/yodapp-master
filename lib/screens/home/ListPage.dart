import 'package:flutter/material.dart';
import 'package:yodapp/screens/home/details.dart';
import 'package:yodapp/screens/home/main_drawer.dart';
import 'package:yodapp/screens/home/new_activity.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''
            'Actividades'),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: MainDrawer(),
      body: _buildListView(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.push(
              context,
          MaterialPageRoute(
              builder: (context) => NewActivity())
          );
        },
      ),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            title: Text('Actividad $index'),
            subtitle: Text('mes #'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(index))
              );
            },
          ),
        );
      },
    );
  }
}