import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';
import './operator/operatorform.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
  List<OpDetails> ops = [
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

  Container viewoperator(op) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: ListTile(
            leading: CircleAvatar(),
            title: Text(op.name),
            subtitle: Text(op.email),
            trailing: IconButton(
                icon: Icon(CupertinoIcons.eye),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new OperatorDetails()));
                }),
            tileColor: Colors.white,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.teal),
        title: Text("Operators",
            style: TextStyle(color: Colors.lightBlue, fontSize: 20)),
      ),
      body: Container(
          color: Colors.grey[250],
          child: Padding(
              padding: EdgeInsets.all(50),
              child: ListView(
                children: ops.map((op) => viewoperator(op)).toList(),
              ))),
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add a new operator",
        child: Icon(CupertinoIcons.add)
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
