import 'package:flutter/material.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/BEST%20MATCHES%20PAGE/constants.dart';

class Posts extends StatefulWidget {
  Posts({this.imageget, this.getbodydata});
  final imageget;
  final getbodydata;
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  var decodeDetails, result;
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var appBar = AppBar().preferredSize.height;
    print(widget.getbodydata);
    decodeDetails = widget.getbodydata;
    result = decodeDetails['result'];
    print(result);
    print(23);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(
              height: height * 0.7,
              width: width,
              child: decodeDetails == null && isCheck == false
                  ? Container(
                      child: Center(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: TweenAnimationBuilder(
                            // builder: (context){
                            builder: (context, _, child) {
                              return CircularProgressIndicator(
                                value: 10.0,
                              );
                            },
                            // },
                            duration: Duration(seconds: 5),
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
                      // itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                            child: Image.network(
                                baseImageUrl + result[index]['image_name']),
                          ),
                        );
                      })),
        ),
      ),
    );
  }
}
