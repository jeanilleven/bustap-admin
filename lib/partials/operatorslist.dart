import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../models/operator.dart';

class OperatorList extends StatefulWidget {
  OperatorList({Key key}) : super(key: key);

  @override
  _OperatorListState createState() => _OperatorListState();
}

class _OperatorListState extends State<OperatorList> {
  @override
  Widget build(BuildContext context) {
    final operatorSnapshot = Provider.of<List<Operator>>(context) ?? [];
    return ListView.builder(
      itemCount: operatorSnapshot.length,
      itemBuilder: (context, index) {
        // return ListTile(
        //     onTap: () {}, 
        //     title: Text(operatorSnapshot[index].email)); 
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
                  child: Text(operatorSnapshot.hashCode.toString(),
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(operatorSnapshot[index].fname + ' ' + operatorSnapshot[index].lname, style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(operatorSnapshot[index].email, style: TextStyle(fontSize: 16)),
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
                        // addOperator(
                            // context, "View Operator Details", "Update", operatorSnapshot);
                      },
                      tooltip: 'View Profile',
                      icon: Icon(CupertinoIcons.eye, color: Colors.blue[200]),
                    )
                  ],
                ),
                Column(children: [
                  IconButton(
                    onPressed: () {
                      // askConfirmation(context, op);
                    },
                    tooltip: 'Delete',
                    icon: Icon(CupertinoIcons.trash, color: Colors.red[200]),
                  )
                ])
              ]),
            )));
      },
      // children: busOps.map((op) => listoperator(op)).toList(),
    );
  }
}
