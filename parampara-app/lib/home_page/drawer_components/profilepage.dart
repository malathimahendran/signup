import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final setNameFacebook = '';
  @override
  void initState() {
    // TODO: implement initState
    getting();
    super.initState();
  }

  getting() async {
    SharedPreferences get = await SharedPreferences.getInstance();
    a.text = get.getString(setNameFacebook);
  }

  var a = TextEditingController();
  var b = TextEditingController();
  var c = TextEditingController();
  var d = TextEditingController();
  var e = TextEditingController();
  var f = TextEditingController();
  var g = TextEditingController();
  var h = TextEditingController();
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Male',
      'label': 'Male',
      // 'icon': Icon(Icons.stop),
    },
    {
      'value': 'Female',
      'label': 'Female',
      // 'icon': Icon(Icons.fiber_manual_record),
      // 'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'others',
      'label': 'others',
      // 'enable': false,
      // 'icon': Icon(Icons.grade),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(''), fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: [
                      BoxShadow(blurRadius: 7.0, color: Colors.black)
                    ])),
            Container(
              child: Flexible(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        TextFormField(
                            enabled: false,
                            controller: a,
                            // onChanged: (text) {
                            //   users.text =
                            //       "" != null ? '${widget.user}' : "hello";
                            // },

                            decoration: InputDecoration(
                                hintText: "username",
                                hintStyle: TextStyle(color: Colors.black))),
                        SizedBox(height: 20.0),
                        TextFormField(
                            controller: b,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person, color: Colors.black),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black))),
                        SizedBox(height: 20.0),
                        TextFormField(
                            controller: c,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person, color: Colors.black),
                                hintText: "First_name",
                                hintStyle: TextStyle(color: Colors.black))),
                        SizedBox(height: 20.0),
                        TextFormField(
                            controller: d,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person, color: Colors.black),
                                hintText: "Last_name",
                                hintStyle: TextStyle(color: Colors.black))),
                        SizedBox(height: 20.0),
                        TextFormField(
                            controller: e,
                            decoration: InputDecoration(
                                icon: Icon(Icons.date_range_rounded,
                                    color: Colors.black),
                                hintText: "Date of Birth",
                                hintStyle: TextStyle(color: Colors.black))),
                        SizedBox(height: 20.0),
                        TextFormField(
                            controller: f,
                            decoration: InputDecoration(
                                icon: Icon(Icons.star_border,
                                    color: Colors.black),
                                hintText: "Religion",
                                hintStyle: TextStyle(color: Colors.black))),
                        SizedBox(height: 20.0),
                        TextFormField(
                            controller: g,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person, color: Colors.black),
                                hintText: "Surname",
                                hintStyle: TextStyle(color: Colors.black))),
                        SizedBox(height: 20.0),
                        TextFormField(
                            controller: h,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person, color: Colors.black),
                                hintText: "Surname",
                                hintStyle: TextStyle(color: Colors.black))),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
