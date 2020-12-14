import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../controller/employeecontroller.dart';
import '../models/employee.dart';
import '../partials/empartials.dart';
import '../partials/partials.dart';

class Drivers extends StatelessWidget {
  const Drivers(this.userDoc, this.userCred, this.auth, {Key key})
      : super(key: key);

  final Auth auth;
  final DocumentSnapshot userDoc;
  final User userCred;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Drivers',
      theme: ThemeData(primaryColor: Colors.blue),
      home: DriversPage(userDoc, userCred, auth,
          title: 'BusTap Admin | Employees'),
    );
  }
}

class DriversPage extends StatefulWidget {
  DriversPage(this.userDoc, this.userCred, this.auth, {Key key, this.title})
      : super(key: key);
  final String title;

  final Auth auth;
  final DocumentSnapshot userDoc;
  final User userCred;
  @override
  _DriversPageState createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: MainDrawer(widget.userDoc, widget.userCred, widget.auth),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.teal),
          title: Text("Employees",
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
              Tab(
                  text: 'Conductors',
                  icon: Icon(Icons.assistant, color: Colors.blue)),
            ],
          ),
        ),
        body: StreamProvider<List<Employee>>.value(
          value: EmployeeController().retrieveAllEmployees,
          child: TabBarView(
            children: [
              Container(
                  color: Colors.grey[250],
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: EmployeeList(employeeType: "Bus Driver"))),
              Container(
                  color: Colors.grey[250],
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: EmployeeList(employeeType: "Jeepney Driver"))),
              Container(
                  color: Colors.grey[250],
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: EmployeeList(employeeType: "Conductor"))),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add a new employee',
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              Employee em = new Employee(
                  email: '',
                  fname: '',
                  licensenum: '',
                  lname: '',
                  phonenum: '',
                  type: '');
              addEmployeeForm(context, "Add Employee", "Add", _formKey, em);
            }),
      ),
    );
  }
}

class DrvrDetails {
  String id;
  String name;
  String email;
  int type; //1 is busdriver, 2 is jeepdriver
  DrvrDetails(this.id, this.name, this.email, this.type);
}
