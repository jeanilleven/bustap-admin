import 'package:flutter/material.dart';
import '../partials/maindrawer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/percent_indicator.dart';  

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
        body: Container(child: DashboardGrid()),
        drawer: MainDrawer());
  }
}

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({Key key}) : super(key: key);

  Material dashboardItem(Column type) {
    return Material(
        color: Colors.white,
        elevation: 14,
        shadowColor: Colors.teal[900],
        borderRadius: BorderRadius.circular(24),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: type
            ),
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
                        Text(title,
                            style: TextStyle(color: textcolor, fontSize: 20)),
                      ]),
                  Divider(
                    height: 50,
                    endIndent: 400,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("300",
                            style: TextStyle(
                                color: textcolor,
                                fontSize: 50,
                                fontWeight: FontWeight.w600)),
                        Text(" out of ",
                            style: TextStyle(
                                color: textcolor,
                                fontSize: 30,
                                fontWeight: FontWeight.w100)),
                        Text("500",
                            style: TextStyle(
                                color: textcolor,
                                fontSize: 50,
                                fontWeight: FontWeight.w600))
                      ])
                ],
              );
  }

  Column profit(String title, Color textcolor){
    return Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title,
                            style: TextStyle(color: textcolor, fontSize: 20)),
                      ]),
                  Divider(
                    height: 50,
                    endIndent: 400,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("100,000.00",
                            style: TextStyle(
                                color: textcolor,
                                fontSize: 50,
                                fontWeight: FontWeight.w600)
                        ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding( 
                        padding: EdgeInsets.all(20),
                        child: CircularPercentIndicator(
                          progressColor: Colors.amber[600],
                          radius: 200.0,
                          lineWidth: 5.0,
                          percent: 1.0,
                          center: new Text("60%", style: TextStyle(color: Colors.green, fontSize: 30)),
                        )
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("higher than yesterday's ratings",
                          style: TextStyle(
                            color: textcolor,
                            fontSize: 18
                          )
                      )
                    ],
                    
                  )
                ],
              );
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 20.0,
      padding: EdgeInsets.all(20),
      children: <Widget>[
        dashboardItem(vehicle("Buses Running", Colors.blueGrey[900])),
        dashboardItem(profit("Today's Earnings", Colors.blueGrey[900])),
        dashboardItem(vehicle("Jeep Running", Colors.blueGrey[900] )),
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 250),
        StaggeredTile.extent(2, 515),
        StaggeredTile.extent(2, 250),
      ],
    );
  }
}
