import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../controller/schedulecontroller.dart';
import '../models/schedules.dart';

  addScheduleForm(BuildContext context, String header, String opt, GlobalKey<FormState> _formKey, Schedule sched) {
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
                  height: 550,
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
                                    if(_formKey.currentState.validate()){
                                      // submitScheduleForm(context, _formKey, em, opt);
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

  void submitScheduleForm(context, _formKey, em, opt) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (opt == "Update") {
        //Some code to update here
      } else {
        //this adds to the list
        
      }
      Navigator.of(context, rootNavigator: true).pop(context);
    }
  }