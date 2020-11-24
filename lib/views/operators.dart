import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';
import './operator/operatorform.dart';

class Operators extends StatelessWidget {
  const Operators({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Operators',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OperatorsPage(title: 'BusTap Admin | Operators'),
    );
  }
}

class OperatorsPage extends StatefulWidget {
  OperatorsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _OperatorsPageState createState() => _OperatorsPageState();
}

class _OperatorsPageState extends State<OperatorsPage> {
  List<OpDetails> busOps = [
    new OpDetails('18400175', 'Berna Ferolin', 'berna@email.com'),
    new OpDetails('18400175', 'Justin Ferolin', 'berna@email.com'),
    new OpDetails('18400175', 'Raz Justinn', 'berna@email.com'),
    new OpDetails('18400175', 'Earl Ferolin', 'berna@email.com'),
    new OpDetails('18400175', 'Conag Earl', 'berna@email.com'),
    new OpDetails('18400175', 'Raz ', 'berna@email.com'),
    new OpDetails('18400175', 'Justin', 'berna@email.com'),
    new OpDetails('18400175', 'Maria', 'berna@email.com'),
    new OpDetails('18400175', 'Ven', 'berna@email.com'),
    new OpDetails('18400175', 'Jay', 'berna@email.com'),
    new OpDetails('18400175', 'Jeanille', 'berna@email.com'),
  ];

  List<OpDetails> jeepOps = [
    new OpDetails('18400175', 'Jenel Ven', 'berna@email.com'),
    new OpDetails('18400175', 'Ven Jeanin', 'berna@email.com'),
    new OpDetails('18400175', 'Abayon Nilln', 'berna@email.com'),
    new OpDetails('18400175', 'Earl Ferolin', 'berna@email.com'),
    new OpDetails('18400175', 'Conag Earl', 'berna@email.com'),
    new OpDetails('18400175', 'Raz ', 'berna@email.com'),
    new OpDetails('18400175', 'Justin', 'berna@email.com'),
    new OpDetails('18400175', 'Maria', 'berna@email.com'),
    new OpDetails('18400175', 'Ven', 'berna@email.com'),
    new OpDetails('18400175', 'Jay', 'berna@email.com'),
    new OpDetails('18400175', 'Jeanille', 'berna@email.com'),
  ];

  Container listoperator(op) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Material(
            elevation: 14,
            shadowColor: Colors.blueGrey,
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  flex: 1,
                  child: Text(op.id, style: TextStyle(color: Colors.blue,fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(op.name, style: TextStyle(fontSize: 20)),
                ),
                Expanded( 
                  flex: 2,
                  child: Text(op.email, style: TextStyle(fontSize: 16)),
                ),
                Spacer(),
                Column(children: [
                  IconButton(
                    onPressed: () {},
                    tooltip: 'View Managed Drivers',
                    icon: Icon(CupertinoIcons.person, color: Colors.blue[200]),
                  )
                ]),
                Column(children: [
                  IconButton(
                    onPressed: () {},
                    tooltip: 'View Managed Buses',
                    icon: Icon(CupertinoIcons.bus, color: Colors.blue[200]),
                  )
                ]),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new OperatorDetails())
                        );
                      },
                      tooltip: 'View Profile',
                      icon: Icon(CupertinoIcons.eye, color: Colors.blue[200]),
                    )
                  ],
                ),
                Column(children: [
                  IconButton(
                    onPressed: () {},
                    tooltip: 'Delete',
                    icon: Icon(CupertinoIcons.trash, color: Colors.red[200]),
                  )
                ])
              ]),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.teal),
          title: Text("Operators",
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
                      children: busOps.map((op) => listoperator(op)).toList(),
                    ))),
            Container(
                color: Colors.grey[250],
                child: Padding(
                    padding: EdgeInsets.all(30),
                    child: ListView(
                      children: jeepOps.map((op) => listoperator(op)).toList(),
                    ))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add a new operator',
            child: Icon(CupertinoIcons.add),
            onPressed: () {}),
      ),
    );
  }
}

class OpDetails {
  String id;
  String name;
  String email;

  OpDetails(this.id, this.name, this.email);
}
