import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../controller/vehiclecontroller.dart';
import '../models/vehicle.dart';
import '../partials/partials.dart';

addVehicleForm(BuildContext context, String header, String opt,
    GlobalKey<FormState> _formKey, Vehicle v) {
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
                    padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
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
                          controller: TextEditingController(text: v.buscode),
                          decoration: InputDecoration(
                            labelText: "Vehicle Number",
                            hintText: v.buscode,
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 0.5)),
                          ),
                          validator: (input) => input.length < 1
                              ? 'This field is required'
                              : null,
                          onSaved: (input) => v.buscode = input,
                        ),
                      ),
                      Container(
                        height: 75,
                        child: TextFormField(
                          controller: TextEditingController(text: v.platenum),
                          decoration: InputDecoration(
                            labelText: "Plate Number",
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 0.5)),
                          ),
                          validator: (input) =>
                              input.length != 6 ? 'Invalid Plate Number' : null,
                          onSaved: (input) => v.platenum = input,
                        ),
                      ),
                      Container(
                        height: 75,
                        child: TextFormField(
                          controller:
                              TextEditingController(text: v.manufacturer),
                          decoration: InputDecoration(
                            labelText: 'Vehicle Manufacturer',
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 0.5)),
                          ),
                          validator: (input) => input.length < 1
                              ? 'This field is required'
                              : null,
                          onSaved: (input) => v.manufacturer = input,
                        ),
                      ),
                      Container(
                        height: 75,
                        child: TextFormField(
                          controller: TextEditingController(
                              text: v.capacity.toString()),
                          decoration: InputDecoration(
                            labelText: 'Maximum Seat Capacity',
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 0.5)),
                          ),
                          validator: (input) => input.length < 1
                              ? 'This field is required'
                              : null,
                          onSaved: (input) => v.capacity = int.parse(input),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: DropdownSearch(
                          searchBoxController:
                              TextEditingController(text: v.type),
                          dialogMaxWidth: 500,
                          maxHeight: 100,
                          items: ["Bus", "Jeepney"],
                          label: "Vehicle Type",
                          // onChanged: print,
                          hint: "Vehicle",
                          showClearButton: true,
                          selectedItem: v.type == '' ? null : v.type,
                          validator: (String item) {
                            if (item == null)
                              return "Invalid Vehicle";
                            else
                              return null;
                          },
                          onSaved: (input) => v.type = input,
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
                                  opt,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    submitVehicleForm(
                                        context, _formKey, v, opt);
                                  }
                                })
                          ],
                        ),
                      ),
                    ]))),
              ),
            ));
      });
}

void submitVehicleForm(context, _formKey, v, opt) {
  if (_formKey.currentState.validate()) {
    _formKey.currentState.save();
    if (opt == "Update") {
      //some update code here
      VehicleController().updateVehicle(v);
    } else {
      //this adds to the list
      // createVehicle(_vehicleNum, _seatCnt, _plateNum, _make, _vType);
      VehicleController().createVehicle(v);
    }
    Navigator.of(context, rootNavigator: true).pop(context);
  }
}

askConfirmation(BuildContext context, Vehicle ve) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Removal Confirmation'),
            content: Text('Are you sure you want to remove ' +
                ve.buscode +
                ' from the list of vehicles?'),
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
                  Navigator.of(context).pop(removeVehicle(ve));
                },
              )
            ]);
      });
}

removeVehicle(ve) {
  VehicleController().deleteVehicle(ve);
}
