import 'package:flutter/material.dart';
import '../views/views.dart';
import '../common/packages.dart';

class ScheduleTable extends StatefulWidget {
  ScheduleTable({Key key}) : super(key: key);

  @override
  _ScheduleTableState createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.teal),
          title: Text("Schedules and Assignments",
              style: TextStyle(color: Colors.lightBlue, fontSize: 20)),
          leading: IconButton(
            icon: Icon(CupertinoIcons.arrow_left),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Vehicles()));
            },
          )),
    );
  }
}
