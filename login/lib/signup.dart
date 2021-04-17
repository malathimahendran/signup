import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Signup"),
        ),
        body: new Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.purple[700],
                  Colors.purple[600],
                  Colors.purple[400],
                  Colors.purple[200],
                ])),
            child: Center(
                child: new Column(children: <Widget>[
              SizedBox(height: 70),
              TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Colors.white),
                      hintText: "FirstName",
                      hintStyle: TextStyle(color: Colors.white))),
              SizedBox(height: 50),
              TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Colors.white),
                      hintText: "LastName",
                      hintStyle: TextStyle(color: Colors.white))),
              SizedBox(height: 50),
              TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.mail, color: Colors.white),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white))),
              SizedBox(height: 50),
              TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock, color: Colors.white),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white))),
              SizedBox(height: 50),
              Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.purple[700],
                        Colors.purple[600],
                        Colors.purple[400],
                        Colors.purple[200],
                      ],
                    ),
                  ),
                  child: ButtonTheme(
                    buttonColor: Colors.white10,
                    // height: 50.0,
                    minWidth: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Register')),
                  ))
            ]))));
  }
}
