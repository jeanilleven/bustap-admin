import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';
import 'package:bustap/services/auth.dart';

class Dashboard extends StatelessWidget {
  final DocumentSnapshot userDoc;
  final User userCred;
  final Auth auth;

  Dashboard(this.userDoc, this.userCred, this.auth);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(userDoc, userCred, auth,
          title: 'BusTap Admin | Dashboard'),
    );
  }
}

class DashboardPage extends StatefulWidget {
  DashboardPage(this.userDoc, this.userCred, this.auth, {Key key, this.title})
      : super(key: key);

  final DocumentSnapshot userDoc;
  final User userCred;
  final String title;
  final Auth auth;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.teal),
          title: Text("Dashboard",
              style: TextStyle(color: Colors.lightBlue, fontSize: 20)),
        ),
        body: Container(child: DashboardGrid()),
        drawer: MainDrawer(widget.userDoc, widget.userCred, widget.auth));
  }
}

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 20.0,
      padding: EdgeInsets.all(20),
      children: <Widget>[
        ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            dashboardItem(vehicle("Buses Running", Colors.blueGrey[900])),
          ],
        ),
        dashboardItem(vehicle("Jeep Running", Colors.blueGrey[900])),
        dashboardItem(profit("Today's Profit", Colors.blueGrey[900])),
        dashboardItem(statistics("More stuff here...", Colors.blueGrey[900])),
        dashboardItem(statistics("Something here...", Colors.blueGrey[900]))
      ],
      staggeredTiles: [
        StaggeredTile.extent(1, 350),
        StaggeredTile.extent(1, 350),
        StaggeredTile.extent(2, 300),
        StaggeredTile.extent(2, 200),
        StaggeredTile.extent(2, 150),
      ],
    );
  }
}

Material dashboardItem(Column type) {
  return Material(
      color: Colors.white,
      elevation: 14,
      shadowColor: Colors.teal[900],
      borderRadius: BorderRadius.circular(24),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(child: type),
        ),
      ));
}

Column vehicle(String title, Color textcolor) {
  return Column(
    children: <Widget>[
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(color: textcolor, fontSize: 20)),
          ]),
      Divider(
        height: 20,
        endIndent: 400,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20), child: ProfitIndicator())
        ],
      ),
    ],
  );
}

Column profit(String title, Color textcolor) {
  return Column(
    children: <Widget>[
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(color: textcolor, fontSize: 20)),
          ]),
      Divider(
        height: 10,
        endIndent: 400,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("100,000.00",
                style: TextStyle(
                    color: textcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ]),
    ],
  );
}

Column statistics(String title, Color textcolor) {
  return Column(children: <Widget>[
    Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyle(color: textcolor, fontSize: 20)),
        ]),
  ]);
}
