import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class MainDrawer extends StatefulWidget {
  MainDrawer({Key key}) : super(key: key);

  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String name = 'usuario';

  @override
  void initState() {
    super.initState();

    _auth.currentUser().then((user) {
      setState(() {
        this.email = user.email;
        this.name = user.displayName;
      });
    });
  }

  doLogout() async {
    await _auth.signOut().then((value) {
      // Navigator.of(context).replace(oldRoute: oldRoute, newRoute: newRoute)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
            ),
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.orangeAccent),
                accountName: Text(
                  "Jorge Castro",
                ),
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                  child: Text("J"),
                  backgroundColor: Colors.white,
                )),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Mis Actividades'),
          ),
          ExpansionTile(
            leading: Icon(Icons.assistant_photo_rounded),
            title: Text(
              'Prioridades',
            ),
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.album_sharp,
                  color: Colors.red,
                ),
                title: Text('Urgente - Importante'),
              ),
              ListTile(
                leading: Icon(
                  Icons.album_sharp,
                  color: Colors.deepOrangeAccent,
                ),
                title: Text('No Urgente - Importante'),
              ),
              ListTile(
                leading: Icon(
                  Icons.album_sharp,
                  color: Colors.amber,
                ),
                title: Text('Urgente - No Importante'),
              ),
              ListTile(
                leading: Icon(
                  Icons.album_sharp,
                  color: Colors.greenAccent,
                ),
                title: Text('No Urgente - No Importante'),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Salir'),
            onTap: doLogout,
          ),
        ],
      ),
    );
  }
}
