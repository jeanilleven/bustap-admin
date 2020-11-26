import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';
import './operator/operatorform.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:email_validator/email_validator.dart';

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
  String _operatorVehicle = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _firstName, _lastName, _email, _fullName,_phoneNum, fName, lName, _opt;
    addOperator(BuildContext context, String header, String option, OpDetails o){
    _opt = option;
    if(o.name != ''){
      fName = o.name.split(" ")[0];
      if(o.name.split(" ").length > 1){
        lName = o.name.split(" ")[1];
      }else{
        lName = '';
      }
    }else{
      fName = lName = '';
    }
    return showDialog(context: context, builder: (context){
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        
        child: Form(
          key:_formKey,
          child: Container(
          height: 540,
          width: 550,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
            child: IntrinsicWidth(              
              child: ListView(
              children: [
                Text(header,
                  textAlign: TextAlign.center,
                  style: TextStyle(  
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                  ) 
                ),
                Divider(height:15,color: Colors.white),
                Divider(height:5,color: Colors.grey[300]),
                Divider(height:5,color: Colors.white),
                Container(
                  height: 75,
                  child: TextFormField(
                    controller: TextEditingController(text: fName),
                    decoration: InputDecoration( 
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => input.length < 1 ? 'This field is required' : null,
                    onSaved: (input) => _firstName = input,
                  ),
                ),
                Container(
                  height: 75,
                  child: TextFormField(
                    controller: TextEditingController(text: lName),
                    decoration: InputDecoration( 
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => input.length < 1 ? 'This field is required' : null,
                    onSaved: (input) => _lastName = input,
                  ),
                ),
                Container(
                  height: 75,
                  child: TextFormField(
                    controller: TextEditingController(text: o.email),
                    decoration: InputDecoration( 
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => EmailValidator.validate(input)? null:"Invalid E-mail Address",
                    onSaved: (input) => _email = input,
                  ),
                ),
                Container(
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration( 
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => input.length != 11 ? 'Invalid Phone Number' : null,
                    onSaved: (input) => _phoneNum = input,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child:DropdownSearch(
                      dialogMaxWidth: 500,
                      maxHeight: 100,
                      items: ["Bus", "Jeepney"],
                      label: "Select a Vehicle",
                      hint:"Vehicle",
                      showClearButton: true,
                      validator: (String item) {
                        if (item == null)
                          return "Invalid Vehicle";
                        else
                          return null;
                      },
                      onSaved: (input) => _operatorVehicle = input,
                    ),
                ),
                Divider(height:25,color: Colors.white),
                Container(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }
                      ),
                      RaisedButton(
                        color: Colors.lightBlue,
                        child: Text(
                          option,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: _submit,
                      )
                    ],
                  ),
                ),
              ]
            ))
          ),
        ),
        )
      );
    });
  }
  void _submit()
  {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      _fullName = _firstName + ' ' + _lastName;
      setState(() {
        if(_opt == "Update"){
          //Some update code here
        }else{
          //this adds to the list
          OpDetails newOperator = new OpDetails('18400175', _fullName, _email);
          if(_operatorVehicle == "Bus"){
            busOps.add(newOperator);
          }else{
            jeepOps.add(newOperator);
          }
        }
      });
      Navigator.of(context, rootNavigator: true).pop(context);
    }
  }
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
                        addOperator(context, "View Operator Details", "Update", op);
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
            onPressed: () {
              OpDetails op = new OpDetails('', '', '');
              addOperator(context, "Add Operator", "Add", op);
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
