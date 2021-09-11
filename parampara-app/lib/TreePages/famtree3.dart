import 'package:flutter/material.dart';
import 'package:googleandfacebook/TreePages/TreeAdd.dart';
import 'package:googleandfacebook/TreePages/professionaldetails.dart';
import 'package:hexcolor/hexcolor.dart';

import '../HOME SCREEN PAGE/home_screen_page.dart';

class FamTree3 extends StatefulWidget {
  const FamTree3({Key key}) : super(key: key);

  @override
  _FamTree3State createState() => _FamTree3State();
}

class _FamTree3State extends State<FamTree3> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
        ),
        backgroundColor: Colors.teal,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          FlatButton(
            padding: EdgeInsets.zero,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Back',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ProfessionalDetails()));
            },
          )
        ],
        title: Text(
          'Add Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(''),
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.teal[400],
                child: Text("Hi"),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              leading: Image.asset('assets/Drawer/homeicon.png'),
              title: Text("Home", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => null));
              },
              leading: Image.asset('assets/Drawer/message.png'),
              title: Text("Message", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TreeAdd()));
              },
              leading: Image.asset('assets/Drawer/treee.png'),
              title: Text("Family Tree",
                  style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => null));
              },
              leading: Image.asset('assets/Drawer/mapicon.png'),
              title: Text(
                "Location",
                style: TextStyle(color: Colors.teal[800]),
              ),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => null));
              },
              leading: Image.asset('assets/Drawer/accounticon.png'),
              title: Text("Account", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => null));
              },
              leading: Image.asset('assets/Drawer/logoutt.png'),
              title: Text("Logout", style: TextStyle(color: Colors.teal[800])),
            ),
            Divider(height: 10.0, color: Colors.transparent),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 70,
              width: 300,
              child: Visibility(
                visible: isVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        "assets/TreePageImages/Tree/view.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                          onTap: () {
                            _bottomSheetMore(context);
                          },
                          child: Image.asset(
                              "assets/TreePageImages/Tree/user.png",
                              height: 20,
                              width: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                          "assets/TreePageImages/Tree/pencil.png",
                          height: 20,
                          width: 20),
                    ),
                    Image.asset("assets/TreePageImages/Tree/delete.png",
                        height: 20, width: 20),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Image.asset(
                      'assets/TreePageImages/Tree/TreeAdd.jpeg',
                      width: 50,
                      height: 50,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _bottomSheetMore(context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 300,
          color: Color(0xFF737373),
          child: new Container(
            padding: EdgeInsets.only(
              left: 5.0,
              right: 5.0,
              top: 5.0,
              bottom: 5.0,
            ),
            decoration: new BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')]),
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0))),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "  Choose an action",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/TreePageImages/Tree/father.png',
                            height: 70,
                            width: 90,
                          ),
                          Text(
                            "Add father",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/TreePageImages/Tree/mother.png',
                            height: 70,
                            width: 90,
                          ),
                          Text(
                            "Add mother",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/TreePageImages/Tree/sisters.png',
                          height: 70,
                          width: 90,
                        ),
                        Text("Add Spouse",
                            style: TextStyle(color: Colors.white)),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/TreePageImages/Tree/sisters.png',
                            height: 70,
                            width: 90,
                          ),
                          Text(
                            "Add child",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/TreePageImages/Tree/brothers.jpeg',
                            height: 70,
                            width: 90,
                          ),
                          Text("Add brother",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/TreePageImages/Tree/sisters.png',
                          height: 70,
                          width: 90,
                        ),
                        Text(
                          "Add sister",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
