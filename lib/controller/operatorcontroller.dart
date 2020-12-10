import '../common/packages.dart';
import '../models/operator.dart';
import '../partials/partials.dart';

class OperatorController {
  CollectionReference operators =
      FirebaseFirestore.instance.collection('operators');
  createOperator(fname, lname, email, phonenum, type) {
    return operators
        .add({
          'fname': fname,
          'lname': lname,
          'email': email,
          'phone_number': phonenum,
          'type': type,
          'deleted': false
        })
        .then((value) => print("Operator Added"))
        .catchError((error) => print("Failed to add operator: $error"));
  }

  List<Operator> _operatorList(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Operator(
            fname: doc.data()['fname'],
            lname: doc.data()['lname'],
            email: doc.data()['email'],
            phonenum: doc.data()['phonenum'],
            type: doc.data()['type']);
      }).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<List<Operator>> get retrieveAllOperators {
    try {
      print(operators.snapshots().map(_operatorList));
      return operators.snapshots().map(_operatorList);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

//Here
String _operatorVehicle = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _firstName, _lastName, _email, _phoneNum, fName, lName, _opt;
  addOperator(BuildContext context, String header, String option, OpDetails o) {
    _opt = option;
    if (o.name != '') {
      fName = o.name.split(" ")[0];
      if (o.name.split(" ").length > 1) {
        lName = o.name.split(" ")[1];
      } else {
        lName = '';
      }
    } else {
      fName = lName = '';
    }
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  height: 540,
                  width: 550,
                  child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
                      child: IntrinsicWidth(
                          child: ListView(children: [
                        Text(header,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        Divider(height: 15, color: Colors.white),
                        Divider(height: 5, color: Colors.grey[300]),
                        Divider(height: 5, color: Colors.white),
                        Container(
                          height: 75,
                          child: TextFormField(
                            controller: TextEditingController(text: fName),
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 0.5)),
                            ),
                            validator: (input) => input.length < 1
                                ? 'This field is required'
                                : null,
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
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 0.5)),
                            ),
                            validator: (input) => input.length < 1
                                ? 'This field is required'
                                : null,
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
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 0.5)),
                            ),
                            validator: (input) => EmailValidator.validate(input)
                                ? null
                                : "Invalid E-mail Address",
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
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 0.5)),
                            ),
                            validator: (input) => input.length != 11
                                ? 'Invalid Phone Number'
                                : null,
                            onSaved: (input) => _phoneNum = input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: DropdownSearch(
                            dialogMaxWidth: 500,
                            maxHeight: 100,
                            items: ["Bus", "Jeepney"],
                            label: "Select a Vehicle",
                            hint: "Vehicle",
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
                        Divider(height: 25, color: Colors.white),
                        Container(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
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
                      ]))),
                ),
              ));
        });
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        if (_opt == "Update") {
          //Some update code here
        } else {
          //this adds to the list
          OperatorController().createOperator(
            _firstName,
            _lastName,
            _email,
            _phoneNum,
            _operatorVehicle,
          );
        }
      });
      Navigator.of(context, rootNavigator: true).pop(context);
    }
  }

