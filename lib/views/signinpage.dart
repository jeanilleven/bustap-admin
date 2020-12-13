import 'package:flutter/material.dart';
import './dashboard.dart';
import 'package:bustap/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum FormType { login, register, forgot_password, re_login }
enum ErrorType { wrong_credentials, other }

class SignInPage extends StatefulWidget {
  SignInPage(this.auth, {this.onSignedIn, this.isReLogin});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  final bool isReLogin;

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email;
  String _password;
  FormType _formType = FormType.login;
  ErrorType _error;
  String header = "Bustap Login";
  final formKey = new GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print("Form is valid");
      return true;
    } else {
      print("Form is not valid");
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        Firebase.initializeApp();
        if (_formType == FormType.login) {
          //use widget member to access members at extended classs

          try {
            UserCredential user =
                await widget.auth.signInWithEmailAndPassword(_email, _password);
            // widget.onSignedIn();
            print("Signed user in: ${user.user.uid}");
          } on FirebaseAuthException catch (e) {
            print(e.message);

            setState(() {
              _error = ErrorType.wrong_credentials;
            });
          }
          // Navigator.
        } else if (_formType == FormType.forgot_password) {
          widget.auth.resetUserPasswordWithEmail(_email);
          print("Password Reset user in: $_email");
          moveToLogin();
        }
      } catch (e) {
        print("Error :)): $e");
      }
    }
  }

  void moveToLogin() {
    //clear inputs
    header = "Bustap Login";
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.login;
    });
  }

  void moveToResetPassword() {
    header = "Bustap Reset Password";
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.forgot_password;
    });
  }

  // Widget getButton() {
  //   if (widget.isReLogin == true) {
  //     return FlatButton(
  //       child: Icon(Icons.arrow_back),
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //     );
  //   }
  // }

  Widget buildError() {
    switch (_error) {
      case ErrorType.wrong_credentials:
        return Row(children: [
          Icon(
            Icons.error_outline,
            color: Colors.redAccent[700],
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            'Email or password is wrong',
            style: TextStyle(
                color: Colors.redAccent[700],
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ]);

      case ErrorType.other:
        return Row(children: [
          Icon(
            Icons.error_outline,
            color: Colors.redAccent[700],
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            'An error occured',
            style: TextStyle(
                color: Colors.redAccent[700],
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ]);

      default:
        return Container(
          height: 0,
          width: 0,
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print('Connection Established');
          return Form(
              key: formKey,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(children: <Widget>[
                        buildError(),
                        Divider(height: 50, color: Colors.white),
                        Text("Wecome back!",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20)),
                        Text("Login to your account.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        Divider(height: 20, color: Colors.white),
                        SizedBox(
                          width: 500,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 0.5)),
                            ),
                            validator: (value) {
                              if (value.length == 0) {
                                return "Email cannot be empty";
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Email is invalid";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) => _email = value,
                          ),
                        ),
                        Divider(height: 20),
                        SizedBox(
                          width: 500,
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.blueAccent),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 0.5))),
                            obscureText: true,
                            validator: (value) {
                              if (value.length < 6) {
                                return "Password must at least be 6 characters";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) => _password = value,
                          ),
                        ),
                        Divider(
                          height: 10,
                        ),
                        SizedBox(
                            width: 500,
                            height: 40,
                            child: RaisedButton(
                                child: Text('Login',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.lightBlueAccent,
                                onPressed: () {
                                  // DocumentSnapshot userDoc;
                                  // User userCred;
                                  if (validateAndSave()) {
                                    // try {
                                    Firebase.initializeApp();
                                    if (_formType == FormType.login) {
                                      //use widget member to access members at extended classs

                                      widget.auth
                                          .signInWithEmailAndPassword(
                                              _email, _password)
                                          .then((value) {
                                        if (value.user.uid ==
                                            'qTNGN4LWmaYBJ7LITUqJ0BM3Cb12') {
                                          firestore
                                              .doc(
                                                  'users/${widget.auth.currentUser().uid}')
                                              .get()
                                              .then((value) {
                                            print(
                                                "LINE 275: Signed user admin: ${value.id}");
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        new Dashboard(
                                                            value,
                                                            widget.auth
                                                                .currentUser(),
                                                            widget.auth)));
                                          }).catchError((e) {
                                            setState(() {
                                              print(
                                                  "LINE 285: uid of operator not found in collection" +
                                                      e.message);
                                              _error =
                                                  ErrorType.wrong_credentials;
                                            });
                                          });
                                        } else {
                                          // try {
                                          DocumentSnapshot userDoc;
                                          firestore
                                              .doc(
                                                  'operators/${value.user.uid}')
                                              .get()
                                              .then((value) {
                                            userDoc = value;
                                            print(
                                                "Signed user admin: ${value.id}");
                                            if (value.exists) {
                                              Navigator.push(
                                                  context,
                                                  new MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          new Dashboard(
                                                              userDoc,
                                                              widget.auth
                                                                  .currentUser(),
                                                              widget.auth)));
                                            } else {
                                              print(
                                                  "user is not an admin or an operator");
                                              setState(() {
                                                _error =
                                                    ErrorType.wrong_credentials;
                                              });
                                            }
                                          }).catchError((e) {
                                            setState(() {
                                              print(
                                                  "LOL NAAY ERROR: uid of operator not found in collection" +
                                                      e.message);
                                              _error =
                                                  ErrorType.wrong_credentials;
                                            });
                                          });
                                          // } catch (e) {
                                          // }
                                        }
                                      }).catchError((e) {
                                        setState(() {
                                          print(
                                              "LOL NAAY ERROR: wrong credentials" +
                                                  e.message);
                                          _error = ErrorType.wrong_credentials;
                                        });
                                      });
                                    }
                                    // } catch (e) {
                                    //   print("Error :)): $e");
                                    // }
                                  }
                                })),
                        Divider(
                          height: 10,
                        ),
                        SizedBox(
                            width: 500,
                            height: 40,
                            child: RaisedButton(
                                child: Text('Sign in with Google',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.blueGrey[900],
                                onPressed: () {})),
                      ]))));
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Text("No data");
        }
        return Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
