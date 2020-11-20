import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          iconTheme: IconThemeData(color: Colors.teal),
        ),
        body: Container(child: DashboardGrid()),
        drawer: MainDrawer());
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
        dashboardItem(vehicle("Buses Running", Colors.blueGrey[900])),
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
