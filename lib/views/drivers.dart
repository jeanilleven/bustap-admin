import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';

class Drivers extends StatelessWidget {
  const Drivers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Drivers',
      theme: ThemeData(
        primaryColor: Colors.blue
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
  List<DrvrDetails> busDrvrs = [
    new DrvrDetails('18400175', 'BUSDRV Berna Ferolin', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVJustin Ferolin', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVRaz Justinn', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVEarl Ferolin', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVConag Earl', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVRaz ', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVJustin', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVMaria', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVVen', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVJay', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVJeanille', 'berna@email.com'),
  ];

  List<DrvrDetails> jeepDrvrs = [
    new DrvrDetails('18400175', 'JEEPDRVRJenel Ven', 'berna@email.com'),
    new DrvrDetails('18400175', 'Ven Jeanin', 'berna@email.com'),
    new DrvrDetails('18400175', 'Abayon Nilln', 'berna@email.com'),
    new DrvrDetails('18400175', 'Earl Ferolin', 'berna@email.com'),
    new DrvrDetails('18400175', 'JEEPDRVRConag Earl', 'berna@email.com'),
    new DrvrDetails('18400175', 'Raz ', 'berna@email.com'),
    new DrvrDetails('18400175', 'JEEPDRVRJustin', 'berna@email.com'),
    new DrvrDetails('18400175', 'Maria', 'berna@email.com'),
    new DrvrDetails('18400175', 'JEEPDRVRVen', 'berna@email.com'),
    new DrvrDetails('18400175', 'Jay', 'berna@email.com'),
    new DrvrDetails('18400175', 'Jeanille', 'berna@email.com'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.teal),
          title: Text("Drivers",
            style: TextStyle(color: Colors.lightBlue, fontSize: 20)),
          bottom: TabBar(
            labelColor: Colors.blue,
            labelStyle: TextStyle(
              fontSize: 15
            ),
            tabs: [
              Tab(
                text: 'Bus',
                icon: Icon(Icons.directions_car, color: Colors.blue),
              ),
              Tab(
                text: 'Jeep',
                icon: Icon(Icons.directions_transit, color: Colors.blue)
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
                  color: Colors.grey[250],
                  child: Padding(
                  padding: EdgeInsets.all(50),
                  child: ListView(
                    children: busDrvrs.map((drv) => listdriver(drv)).toList(),
              ))), 
            Container(
                  color: Colors.grey[250],
                  child: Padding(
                  padding: EdgeInsets.all(50),
                  child: ListView(
                    children: jeepDrvrs.map((drv) => listdriver(drv)).toList(),
              ))), 
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add a new driver', 
          child: Icon(CupertinoIcons.add),
          onPressed: (){}
        ),
      ),
    );
  }

  Container listdriver(drv) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: ListTile(
            leading: CircleAvatar(),
            title: Text(drv.name),
            subtitle: Text(drv.email),
            trailing: IconButton(
                icon: Icon(CupertinoIcons.eye),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     new MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             new drveratorDetails()));
                }),
            tileColor: Colors.white,
          ),
        ));
  }
}

class DrvrDetails {
  String id;
  String name;
  String email;

  DrvrDetails(this.id, this.name, this.email);
}