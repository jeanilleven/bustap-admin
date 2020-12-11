import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../controller/operatorcontroller.dart';
import '../models/operator.dart';
import '../partials/partials.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  askConfirmation(BuildContext context, object) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Removal Confirmation'),
              content: Text('Are you sure you want to remove ' +
                  object.id +
                  ' - ' +
                  object.name +
                  ' from the list of operators?'),
              actions: [
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(context).pop(removeOperator(object));
                  },
                )
              ]);
        });
  }

  removeOperator(object) {
    setState(() {
      // busOps.remove(object);
    });
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
        body: StreamProvider<List<Operator>>.value(
          value: OperatorController().retrieveAllOperators,
          child: TabBarView(
            children: [
              Container(
                  color: Colors.grey[250],
                  child: Padding(
                      padding: EdgeInsets.all(30), 
                      child: OperatorList(operatorType: "Bus"))),
              Container(
                  color: Colors.grey[250],
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: OperatorList(operatorType: "Jeepney"))),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add a new operator',
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              Operator op = new Operator(fname: "", lname: "", email: "", phonenum: "", type: "");
              addOperatorForm(context, "Add Operator", "Add", _formKey, op);
            }),
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
