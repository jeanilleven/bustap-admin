import 'package:flutter/material.dart';
import '../partials/maindrawer.dart';
import '../partials/statistics.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Statistics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatisticsPage(title: 'BusTap Admin | Statistics'),
    );
  }
}

class StatisticsPage extends StatefulWidget {
  StatisticsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
        ),
        body: Container(  
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: RaisedButton(  
                        child: Text('Bus'),
                        onPressed: (){}
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: RaisedButton(  
                        child: Text('Jeep'),
                        onPressed: (){}
                      ),
                    ),
                  ]
                ),
              ),
              Container(
                width: 1000,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded( 
                      child:Chart()
                    )
                  ]
                )
              ),
            ],
          )
        ),
        drawer: MainDrawer());
  }
}
