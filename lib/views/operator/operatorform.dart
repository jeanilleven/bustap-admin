import 'package:flutter/material.dart';
import '../views.dart';
import 'package:flutter/cupertino.dart';

class OperatorDetails extends StatelessWidget {
  const OperatorDetails({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Operators',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OperatorDetailsPage(title: 'BusTap Admin | Operators'),
    );
  }
}

class OperatorDetailsPage extends StatefulWidget {
  OperatorDetailsPage({Key key, this.title}) : super(key: key);
  final String title;
  

  @override
  _OperatorDetailsPageState createState() => _OperatorDetailsPageState();
}

class _OperatorDetailsPageState extends State<OperatorDetailsPage> {
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
                      builder: (BuildContext context) => new Operators()));
            },
            icon: Icon(CupertinoIcons.arrow_left),
          )
        ],
      ),
    );
  }
}
