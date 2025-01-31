import 'package:flutter/material.dart';
import '../views/views.dart';
import '../common/packages.dart';
import 'package:bustap/services/auth.dart';
import '../main.dart';

class MainDrawer extends StatelessWidget {
  final DocumentSnapshot userDoc;
  final User userCred;
  const MainDrawer(this.userDoc, this.userCred, this.auth, {Key key})
      : super(key: key);
  final Auth auth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      ListTile(
        leading: Text('BusTap',
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 28)),
      ),
      Divider(height: 40),
      ListTile(
        leading: CircleAvatar(
            backgroundImage: new NetworkImage(
                'https://images-na.ssl-images-amazon.com/images/I/41dn8MN3O3L._SX342_QL70_ML2_.jpg'),
            backgroundColor: Colors.lightBlueAccent,
            radius: 30),
        title: Text("temp", style: TextStyle(fontSize: 18)),
        subtitle: Text(userCred.email.toString()),
      ),
      Divider(height: 40),
      ListTile(
          leading: Icon(Icons.dashboard_outlined),
          title: Text('Dashboard'),
          hoverColor: Colors.lightBlue[100],
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new Dashboard(userDoc, userCred, auth)));
          }),
      ListTile(
        leading: Icon(Icons.bar_chart_outlined),
        title: Text('Statistics'),
        hoverColor: Colors.lightBlue[100],
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new Statistics(userDoc, userCred, auth)));
        },
      ),
      ListTile(
          leading: Icon(Icons.supervised_user_circle_outlined),
          title: Text('Operators'),
          hoverColor: Colors.lightBlue[100],
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new Operators(userDoc, userCred, auth)));
          }),
      ListTile(
          leading: Icon(CupertinoIcons.person),
          title: Text('Employees'),
          hoverColor: Colors.lightBlue[100],
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new Drivers(userDoc, userCred, auth)));
          }),
      ListTile(
          leading: Icon(CupertinoIcons.bus),
          title: Text('Vehicles'),
          hoverColor: Colors.lightBlue[100],
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new Vehicles(userDoc, userCred, auth)));
          }),
      ListTile(
          leading: Icon(CupertinoIcons.location),
          title: Text('Terminals'),
          hoverColor: Colors.lightBlue[100],
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new Terminals(userDoc, userCred, auth)));
          }),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('User Management'),
      ),
      Divider(
        height: 70,
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
          hoverColor: Colors.lightBlue[100],
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            auth.signOut().then((value) {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new MyHomePage()));
            });
          }),
    ]));
  }
}
