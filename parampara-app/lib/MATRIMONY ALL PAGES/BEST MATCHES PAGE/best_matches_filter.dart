import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../matrimony_search_your_partner.dart';
import 'best_matchesCard.dart';
import 'constants.dart';

class BestMatchesFilter extends StatefulWidget {
  BestMatchesFilter({this.result});
  final result;
  @override
  _BestMatchesFilterState createState() => _BestMatchesFilterState();
}

class _BestMatchesFilterState extends State<BestMatchesFilter> {
  bool isCheck = false;

  @override
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var status = MediaQuery.of(context).padding.top;
    var appBar = AppBar().preferredSize.height;
    print(widget.result);
    var result = widget.result;
    print(26);
    print(14);
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
            SingleChildScrollView(
              child: Container(
                  color: Colors.grey[300],
                  height: height * 0.80,
                  width: width,
                  child: result == null && isCheck == false
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
                          itemCount: result.length,
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
                                                        result[index])));
                                  },
                                  child: Row(
                                    children: [
                                      Align(
                                        child: Container(
                                          width: width * 0.30,
                                          child: Image.network(
                                            baseImageUrl +
                                                result[index]['photo2'],
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
                                              '${result[index]['name']}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'RobotoMono',
                                                  color: Colors.black),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              ' ${result[index]['email']}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'RobotoMono',
                                                  color: Colors.black),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              '${result[index]['address']}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'RobotoMono',
                                                  color: Colors.black),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              '${result[index]['mobile_number']}',
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
