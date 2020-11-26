import 'package:flutter/material.dart';
import '../views/views.dart';
import '../common/packages.dart';

class ScheduleTable extends StatefulWidget {
  ScheduleTable({Key key}) : super(key: key);

  @override
  _ScheduleTableState createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

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
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(100, 30, 100, 100),
                child: TableCalendar(
                  initialCalendarFormat: CalendarFormat.twoWeeks,
                  calendarController: _controller,
                  calendarStyle: CalendarStyle(
                      todayColor: Colors.blue[100],
                      todayStyle:
                          TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
                      selectedColor: Colors.cyan[400],
                      selectedStyle:
                          TextStyle(color: Colors.black, fontSize: 20)),
                  headerStyle: HeaderStyle(
                    formatButtonShowsNext: false,
                  ),
                  onDaySelected: (day, events, holidays) {
                    print(day.toString());
                  },
                ))
          ],
        )));
  }
}
