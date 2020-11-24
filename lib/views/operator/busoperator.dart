// import 'package:flutter/material.dart';
// import 'operatorform.dart';




// class OpDetails {
//   String id;
//   String name;
//   String email;

//   OpDetails(this.id, this.name, this.email);
// }

// List<OpDetails> ops = [
//     new OpDetails('18400175', 'Berna Ferolin', 'berna@email.com'),
//     new OpDetails('18400175', 'Justin Ferolin', 'berna@email.com'),
//     new OpDetails('18400175', 'Raz Justinn', 'berna@email.com'),
//     new OpDetails('18400175', 'Earl Ferolin', 'berna@email.com'),
//     new OpDetails('18400175', 'Conag Earl', 'berna@email.com'),
//     new OpDetails('18400175', 'Raz ', 'berna@email.com'),
//     new OpDetails('18400175', 'Justin', 'berna@email.com'),
//     new OpDetails('18400175', 'Maria', 'berna@email.com'),
//     new OpDetails('18400175', 'Ven', 'berna@email.com'),
//     new OpDetails('18400175', 'Jay', 'berna@email.com'),
//     new OpDetails('18400175', 'Jeanille', 'berna@email.com'),
//   ];

//   Container viewoperator(context, op) {
//     return Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(7),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(2),
//           child: ListTile(
//             leading: CircleAvatar(),
//             title: Text(op.name),
//             subtitle: Text(op.email),
//             trailing: IconButton(
//                 icon: Icon(Icons.panorama_fish_eye_outlined),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       new MaterialPageRoute(
//                           builder: (BuildContext context) =>
//                               new OperatorDetails()));
//                 }),
//             tileColor: Colors.white,
//           ),
//         );