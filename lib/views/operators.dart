import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../controller/operatorcontroller.dart';
import '../models/operator.dart';
import '../partials/partials.dart';

import 'package:bustap/services/auth.dart';

class Operators extends StatelessWidget {
  const Operators(this.userDoc, this.userCred, this.auth, {Key key})
      : super(key: key);
  final Auth auth;
  final DocumentSnapshot userDoc;
  final User userCred;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Operators',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OperatorsPage(userDoc, userCred, auth, title: 'BusTap Admin | Operators'),
    );
  }
}

class OperatorsPage extends StatefulWidget {
  OperatorsPage(this.userDoc, this.userCred, this.auth, {Key key, this.title})
      : super(key: key);
  final String title;

  final Auth auth;
  final DocumentSnapshot userDoc;
  final User userCred;
  @override
  _OperatorsPageState createState() => _OperatorsPageState();
}

class _OperatorsPageState extends State<OperatorsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(widget.userDoc, widget.userCred, widget.auth),
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
              Operator op = new Operator(
                  fname: "", lname: "", email: "", phonenum: "", type: "");
              addOperatorForm(context, "Add Operator", "Add", _formKey, op);
            }),
      ),
    );
  }
}
