import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../views.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Drivers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DriverDetailsPage(title: 'BusTap Admin | Drivers'),
    );
  }
}

class DriverDetailsPage extends StatefulWidget {
  DriverDetailsPage({Key key, this.title}) : super(key: key);
  final String title;
  

  @override
  _DriverDetailsPageState createState() => _DriverDetailsPageState();
}

class _DriverDetailsPageState extends State<DriverDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.teal),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Drivers()));
            },
            icon: Icon(CupertinoIcons.arrow_left),
          )
        ],
      ),
    );
  }
}
