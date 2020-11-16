import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
          leading: Text('BusTap',
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 28)),
          ),
          Divider(
            height: 40
          ),
          ListTile(
            leading:
                CircleAvatar(backgroundColor: Colors.lightBlueAccent, radius: 30),
            title: Text('John Doe', style: TextStyle(fontSize: 18)),
            subtitle: Text('johndoe@email.com'),
          ),
          Divider(
            height: 40
          ),
          ListTile(
            leading: Icon(Icons.dashboard_outlined),
            title: Text('Dashboard'),
          ),
          ListTile(
            leading: Icon(Icons.bar_chart_outlined),
            title: Text('Statistics'),
            hoverColor: Colors.lightBlueAccent,
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle_outlined),
            title: Text('Operators'),
            hoverColor: Colors.lightBlueAccent,
          ),
          ListTile(
            leading: Icon(Icons.directions_bus_rounded),
            title: Text('Drivers'),
            hoverColor: Colors.lightBlueAccent,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('User Management'),
          ),
          Divider(
            height:120,
            thickness: 0.5,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ]
      )
     
    );
  }
}
