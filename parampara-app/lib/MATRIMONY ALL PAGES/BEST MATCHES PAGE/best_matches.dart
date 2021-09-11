import 'package:flutter/material.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/BEST%20MATCHES%20PAGE/constants.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/MANAGE%20PHOTOS%20PAGE/manage_photos.dart';
// import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/matrimony_search_your_partner.dart';
import 'package:googleandfacebook/TEST%20PAGE/test_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../matrimony_search_your_partner.dart';
import 'best_matchesCard.dart';

class BestMatches extends StatefulWidget {
  @override
  _BestMatchesState createState() => _BestMatchesState();
}

class _BestMatchesState extends State<BestMatches> {
  var valueForCircular = 0.0;
  var decodeDetails;
  var result;
  var result1;
  var result2;
  var result3;
  var response1;
  var familyId;
  bool isCheck = false;
  @override
  void initState() {
    super.initState();
    getMat();
    getMatFam();
  }

  getMatFam() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    print(familyId[0]);
    print(familyId[1]);
    final String url =
        "https://www.cviacserver.tk/parampara/v1/getFamilyMaritalStatus/${familyId[0]}";
    var response = await http.get(Uri.parse(url));
    print(response);
    decodeDetails = json.decode(response.body);
    print(decodeDetails);
    setState(() {
      response1 = decodeDetails['maritalStatus'];
      result = decodeDetails['maritalStatus'][0]['name'].toString();
      print(result);
      result1 = decodeDetails['maritalStatus'][0]['address'].toString();
      result2 = decodeDetails['maritalStatus'][0]['date_of_birth'].toString();
      result3 = decodeDetails['maritalStatus'][0]['address'].toString();
      print(result1);
      print(result2);
      print(result3);

      // isCheck = true;
    });
  }

  getMat() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    print(familyId[0]);
    print(familyId[1]);
    final String url =
        "https://www.cviacserver.tk/parampara/v1/getPersonMatrimonyDetails/${familyId[1]}";
    var response = await http.get(Uri.parse(url));
    print(response);
    decodeDetails = json.decode(response.body);
    print(decodeDetails);
    setState(() {
      response1 = decodeDetails['maritalStatus'];
      result = decodeDetails['maritalStatus'][0]['name'].toString();
      print(result);
      result1 = decodeDetails['maritalStatus'][0]['address'].toString();
      result2 = decodeDetails['maritalStatus'][0]['date_of_birth'].toString();
      result3 = decodeDetails['maritalStatus'][0]['address'].toString();
      print(result1);
      print(result2);
      print(result3);

      // isCheck = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(ConstantPhotos.photo2);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var status = MediaQuery.of(context).padding.top;
    var appBar = AppBar().preferredSize.height;
    // var appbar = appbarr.preferredSize.height;
    // print(appbar);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                HexColor('#0A4E51'),
                HexColor('#149BA1'),
              ],
            ),
          ),
        ),
        // backgroundColor: Colors.teal.shade700,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Best Matches',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        height: (height - appBar),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: (height - appBar) * 0.1,
              width: width,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Partner Profile',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_3),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MatrimonySearchYourPartner()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: height * 0.005),
            SingleChildScrollView(
              child: Container(
                  color: Colors.grey[300],
                  height: height * 0.80,
                  width: width,
                  child: decodeDetails == null && isCheck == false
                      ? Container(
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: TweenAnimationBuilder(
                                // builder: (context){
                                builder: (context, _, child) {
                                  return CircularProgressIndicator(
                                    value: 10.0,
                                  );
                                },
                                // },
                                duration: Duration(seconds: 10),
                                tween: Tween(begin: 0.0, end: 100.0),
                                onEnd: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                            title: Text('No datas found'));
                                      });
                                },
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: response1.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: (height - appBar) * 0.2,
                              width: width * 0.7,
                              child: Card(
                                // color: Colors.teal,
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(15.0),
                                // ),
                                // color: Colors.red,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BestMatchesFullDetails(
                                                    bestMatches:
                                                        response1[index])));
                                  },
                                  child: Row(
                                    children: [
                                      Align(
                                        child: Container(
                                          width: width * 0.30,
                                          child: Image.network(
                                            baseImageUrl +
                                                response1[index]['photo2'],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.4,
                                        padding: EdgeInsets.only(
                                            top: ((height - appBar) * 0.15) *
                                                0.17,
                                            left: 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${response1[index]['name']}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'RobotoMono',
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              ' ${response1[index]['email']}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'RobotoMono',
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '${response1[index]['address']}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'RobotoMono',
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '${response1[index]['mobile_number']}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'RobotoMono',
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
            ),
          ],
        ),
      ),
    );
  }
}
