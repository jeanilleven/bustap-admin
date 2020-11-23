import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';

class Drivers extends StatelessWidget {
  const Drivers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Operators',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DriversPage(title: 'BusTap Admin | Drivers'),
    );
  }
}

class DriversPage extends StatefulWidget {
  DriversPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DriversPageState createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer()
    );
  }
}
