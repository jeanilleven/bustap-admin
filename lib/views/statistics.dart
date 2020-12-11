import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';

import 'package:bustap/services/auth.dart';

class Statistics extends StatelessWidget {
  const Statistics(this.userDoc, this.userCred, this.auth, {Key key})
      : super(key: key);

  final Auth auth;
  final DocumentSnapshot userDoc;
  final User userCred;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Statistics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatisticsPage(userDoc, userCred, auth,
          title: 'BusTap Admin | Statistics'),
    );
  }
}

class StatisticsPage extends StatefulWidget {
  StatisticsPage(this.userDoc, this.userCred, this.auth, {Key key, this.title})
      : super(key: key);
  final Auth auth;
  final DocumentSnapshot userDoc;
  final User userCred;
  final String title;
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(widget.userDoc, widget.userCred, widget.auth),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.teal),
          title: Text("Statistics",
              style: TextStyle(color: Colors.lightBlue, fontSize: 20)),
          bottom: TabBar(
            labelColor: Colors.blue,
            labelStyle: TextStyle(fontSize: 15),
            tabs: [
              Tab(
                text: 'Bus',
                icon: Icon(Icons.directions_car, color: Colors.blue),
              ),
              Tab(
                  text: 'Jeep',
                  icon: Icon(Icons.directions_transit, color: Colors.blue)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
                color: Colors.grey[250],
                child: Padding(
                    padding: EdgeInsets.all(30),
                    child: ListView(
                      children: [Chart()],
                    ))),
            Container(
                color: Colors.grey[250],
                child: Padding(
                    padding: EdgeInsets.all(30),
                    child: ListView(
                      children: [Chart()],
                    ))),
          ],
        ),
      ),
    );
  }
}
