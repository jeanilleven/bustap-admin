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
        return ListTile(
            onTap: () {}, 
            title: Text(operatorSnapshot[index].fname));
      },
      // children: busOps.map((op) => listoperator(op)).toList(),
    );
  }
}
