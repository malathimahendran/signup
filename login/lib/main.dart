import 'package:flutter/material.dart';
import 'package:login/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Loginpage"),
          centerTitle: true,
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
                      icon: Icon(Icons.account_circle, color: Colors.white),
                      hintText: "Username",
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
                  child: ElevatedButton(onPressed: () {}, child: Text('Login')),
                ),
              ),
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
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text('SignUP')),
                ),
              ),
            ]))));
  }
}
