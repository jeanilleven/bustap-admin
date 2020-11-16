import 'package:flutter/material.dart';
import '../partials/maindrawer.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BusTap Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(title: 'BusTap Admin | Dashboard'),
    );
  }
}

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
        ),
        body: Container(),
        drawer: MainDrawer());
  }
}
