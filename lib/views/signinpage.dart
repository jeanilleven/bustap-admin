import 'package:flutter/material.dart';
import './dashboard.dart';


class SignInPage extends StatefulWidget {
  SignInPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(  
        color: Colors.white,
      ),
      child: Column( 
            children: <Widget>[
              Divider(height: 50, color: Colors.white),
              Text("Wecome back!",
                textAlign: TextAlign.left,
                style: TextStyle(  
                  fontSize: 20
                ) 
              ),
              Text("Login to your account.",
                style: TextStyle(  
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                )
              ),
              Divider(height:20,color: Colors.white),
              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: InputDecoration( 
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                    ),
                  ),
                ),
              ),
              Divider(height:20),
              SizedBox(
                width: 500,
                child: TextFormField(
                  decoration: InputDecoration( 
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                    )
                  ),
                  obscureText: true,
                ),
              ),
              Divider(height: 10,),
              SizedBox(
                width: 500,
                height: 40,
                child: RaisedButton(
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                  color: Colors.lightBlueAccent,
                  onPressed: (){
                    Navigator.push(context, 
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new Dashboard())
                    );
                  }
                )
              ),
              Divider(height: 10,),
              SizedBox(
                width: 500,
                height: 40,
                child: RaisedButton(
                  child: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
                  color: Colors.blueGrey[900],
                  onPressed: (){
                    
                  }
                )
              ),
              
            ]
          )
    );
  }
}
