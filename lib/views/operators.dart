import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';
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
  addOperatorModal(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              scrollable: true,
              title: Text("Operator Details"),
              content: TextField(
                controller: customController,
              ),
              actions: <Widget>[
                RaisedButton(
                    elevation: 5.0, child: Text('Cancel'), onPressed: () {}),
                RaisedButton(
                    elevation: 5.0, child: Text('Submit'), onPressed: () {})
              ]);
        });
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
            color: Colors.pink[100],
            child: Padding(
                padding: EdgeInsets.all(50),
                // child: operatorsData(context)
                child: Text('hello')
            )
        ),
        drawer: MainDrawer());
  }
}

const tableColumnWidths = {
  0: FlexColumnWidth(4),
  1: FlexColumnWidth(6),
  2: FlexColumnWidth(10),
  3: FlexColumnWidth(2),
  4: FlexColumnWidth(2),
  5: FlexColumnWidth(2),
  6: FlexColumnWidth(2)
};

Material operatorTableHeader(context) {
  addOperatorModal(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              scrollable: true,
              title: Text("Operator Details"),
              content: TextField(
                controller: customController,
              ),
              actions: <Widget>[
                RaisedButton(
                    elevation: 5.0, child: Text('Cancel'), onPressed: () {}),
                RaisedButton(
                    elevation: 5.0, child: Text('Submit'), onPressed: () {})
              ]);
        });
  }
  return Material(
      color: Colors.white,
      elevation: 14,
      shadowColor: Colors.teal[900],
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: EdgeInsets.all(30), 
        child: Table(
          border: TableBorder(
            horizontalInside: BorderSide(
              color: Colors.blueGrey[200], width: 0.5
            )
          ),
          children: [ 
            TableRow(children: [
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8),
                                child:
                                    Text('ID', style: TextStyle(fontSize: 18)))
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8),
                                child: Text('Name',
                                    style: TextStyle(fontSize: 18)))
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8),
                                child: Text('Email',
                                    style: TextStyle(fontSize: 18)))
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Column(),
                        Column(),
                        Column(),
                        Column(
                          children: <Widget>[
                            RaisedButton(
                                color: Colors.lightBlueAccent,
                                child: Text('Add',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  addOperatorModal(context);
                                })
                          ],
                        ),
                      ]),
          ]
        )
      )
  );
}

Material operatorsData(context) {
  // int iconSize = 40;

  

  var op1 =
      new OperatorDetails('OP18400179', 'Johnny Dooe', 'johnny@email.com');
  var op2 =
      new OperatorDetails('OP19402034', 'Lester Winston', 'lester@email.com');
  var op3 = new OperatorDetails(
      'OP53447998', 'Betty Marshall', 'bettymarshall@email.com');

  var opDetails = [op1, op2, op3];

  return Material(
      color: Colors.white,
      elevation: 14,
      shadowColor: Colors.teal[900],
      borderRadius: BorderRadius.circular(24),
      child: Padding(
          padding: EdgeInsets.all(30),
          child: DraggableScrollableSheet(builder: (context, scrollController) {
            return SingleChildScrollView(
                controller: scrollController,
                child: Table(
                    columnWidths: tableColumnWidths,
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder(
                        horizontalInside: BorderSide(
                            color: Colors.blueGrey[200], width: 0.5)),
                    children: [
                      
                      getOperatorDetails(opDetails[0]),
                      getOperatorDetails(opDetails[1]),
                      getOperatorDetails(opDetails[2]),
                      getOperatorDetails(opDetails[0]),
                      getOperatorDetails(opDetails[1]),
                      getOperatorDetails(opDetails[2]),
                    ]));
          })));
}

TableRow getOperatorDetails(OperatorDetails op) {
  return TableRow(children: [
    Column(
      children: [
        Padding(
            padding: EdgeInsets.all(8),
            child: Text(op.id, style: TextStyle(fontSize: 16)))
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
    ),
    Column(
      children: [
        Padding(
            padding: EdgeInsets.all(8),
            child: Text(op.name, style: TextStyle(fontSize: 16)))
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
    ),
    Column(
      children: [
        Padding(
            padding: EdgeInsets.all(8),
            child: Text(op.email, style: TextStyle(fontSize: 16)))
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
    ),
    Column(children: [
      IconButton(icon: Icon(CupertinoIcons.bus), onPressed: () {})
    ]),
    Column(children: [
      IconButton(icon: Icon(CupertinoIcons.person), onPressed: () {})
    ]),
    Column(children: [
      IconButton(icon: Icon(CupertinoIcons.eye), onPressed: () {})
    ]),
    Column(children: [
      IconButton(icon: Icon(CupertinoIcons.trash), onPressed: () {})
    ]),
  ]);
}

class OperatorDetails {
  String id;
  String name;
  String email;

  OperatorDetails(this.id, this.name, this.email);
}
