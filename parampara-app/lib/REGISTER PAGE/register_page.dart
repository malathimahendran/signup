import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googleandfacebook/Login%20Page/login_page.dart';
import 'package:googleandfacebook/REGISTER%20PAGE/REGISTER%20PAGE%20SUPPORT%20FILES/custom_checkbox.dart';
import 'package:googleandfacebook/REGISTER%20PAGE/REGISTER%20PAGE%20SUPPORT%20FILES/custom_text_form_field.dart';
import 'package:googleandfacebook/SHARED%20PREFERENCES/shared_preferences.dart';
import 'package:googleandfacebook/STAY%20CONNECTED%20PAGE/stay_connected.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';

class RegisterPageForParampara extends StatefulWidget {
  RegisterPageForParampara({this.googleId, this.facebookId});
  final googleId;
  final facebookId;
  @override
  _RegisterPageForParamparaState createState() =>
      _RegisterPageForParamparaState();
}

class _RegisterPageForParamparaState extends State<RegisterPageForParampara> {
  var logger = Logger();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var familyNameController = TextEditingController();
  var familyIdController = TextEditingController();
  var keyboardType, returnText, labelText, controller, value;
  var formKey = GlobalKey<FormState>();
  var onChanged;
  bool isChecked = false,
      secureText = true,
      secureText1 = true,
      _selected = false;
  var titleText;
  var obscureText;
  bool obscureText1 = true;
  var suffixIcon, onPressed, storingId, storingData, icon;
  var googleOrFacebookImage;
  var correctGoogleId;
  var correctFacebookId;
  var correctProfileImage;
  String familyIdToStore;
  @override
  void initState() {
    super.initState();

    getData();
  }

  // hexColor(String color) {
  //   var colors = color.replaceFirst('#', '');
  //   var givenColor = int.parse('0xFF' + colors);
  //   return givenColor;
  // }
  getData() async {
    var gettingData = Shared().shared().then((value) {
      List<String> storingData = value.getStringList('storeData');
      List<String> storingIdAndImage = value.getStringList('idAndProfileImage');
      print(storingIdAndImage);
      setState(() {
        nameController.text = storingData[0].toString();
        if (storingData[1] == null) {
          emailController.text = ''.toString();
          print('line 67');
        } else {
          emailController.text = storingData[1].toString();
        }

        print(61);
        storingForVisible = storingData[1].toString();
        if (storingIdAndImage[0] == widget.googleId) {
          correctGoogleId = storingIdAndImage[0];
          correctProfileImage = storingIdAndImage[1];
          correctFacebookId = '';
          // print(correctGoogleId);
          // print(correctProfileImage);
          // print(71);
        } else if (storingIdAndImage[0] == widget.facebookId) {
          correctFacebookId = storingIdAndImage[0];
          correctProfileImage = storingIdAndImage[1];
          correctGoogleId = '';
          // print(correctFacebookId);
          // print(correctProfileImage);
          // print(77);
        } else if (storingIdAndImage[0] == '') {
          correctGoogleId = '';
          correctFacebookId = '';
          correctProfileImage = '';
        }
      });
    });
  }

  clear() {
    Shared().shared().then((value) {
      value.clear();
      print('clea');
    });
  }

  hello() {
    return Container();
  }

  Future apiRegisterPageToPost() async {
    var url = Uri.parse('https://www.cviacserver.tk/parampara/v1/registration');
    var response = await http.post(url, body: {
      'user_name': nameController.text.toString(),
      'email': emailController.text.toString(),
      // 'user_name': 'hello',
      // 'email': 'where',
      'phone': mobileController.text.toString(),
      // 'phone': 3333.toString(),
      // if (passwordController.text.toString() ==
      //     confirmPasswordController.text.toString())
      'pass': passwordController.text.toString(),
      // 'pass': '234234',
      'family_name': familyNameController.text.toString(),
      // 'family_name': 'hello',
      'family_id': familyIdController.text.toString(),
      // 'family_id': '',
      'google_id': correctGoogleId.toString(),
      // 'google_id': '1qqq',
      'face_book': correctFacebookId.toString(),
      // 'face_book': '',
      'profile_image': correctProfileImage.toString()
      // 'profile_image': '1we'
    }).then((value) async {
      var decodeDetails = json.decode(value.body);
      print(decodeDetails);
      var extractedDetail = decodeDetails['status'];
      familyIdToStore = decodeDetails['user'][0]['family_id'].toString();
      var extractedDetail1 = decodeDetails['user'][0]['family_id'].toString();
      var extractedDetail2 = decodeDetails['user'][0]['id'].toString();
      List<String> details = [extractedDetail1, extractedDetail2];
      SharedPreferences prefer = await SharedPreferences.getInstance();
      await prefer.setStringList('idS', details);
      await Shared()
          .shared()
          .then((value) => value.setString('family_id', familyIdToStore));
      if (extractedDetail == true) {
        final snackBar = SnackBar(
          backgroundColor: Colors.teal,
          content: Text('Registration Successfully'),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        var extractedFacebookId = decodeDetails['user'][0]['facebook'];
        var extractedGoogleId = decodeDetails['user'][0]['google_id'];
        print(extractedFacebookId);
        print(156);
        print(extractedGoogleId);
        // if (extractedFacebookId == correctFacebookId ||
        //     extractedGoogleId == correctGoogleId) {
        //   logger.wtf("its here in if");
        //   Navigator.popAndPushNamed(context, '/stayConnectedPage');

        // } else {
        //   logger.wtf("its here in else");
        //   return Navigator.popAndPushNamed(context, '/loginPage');
        // }

        extractedFacebookId == correctFacebookId ||
                extractedGoogleId == correctGoogleId
            ? Navigator.popAndPushNamed(context, '/stayConnectedPage')
            : Navigator.popAndPushNamed(context, '/loginPage');
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('User Already Exists'),
          duration: Duration(seconds: 4),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // Navigator.popAndPushNamed(context, '/stayConnected');
      }
      logger.log(Level.debug, "inside create account in then function");
    });
  }

  var storingForVisible = '';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var status = MediaQuery.of(context).padding.top;
    return Scaffold(
      // bottomSheet: hello(),
      body: Container(
        height: height,
        width: width,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'assets/Login Page Folder/Images/background_image.png'),
            ),
          ),
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          height: ((height - status)),
          width: width,
          // color: Colors.teal.shade400,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  Container(
                    // height: ((height - status)) * 0.07,
                    width: width,
                    child: customTextFormFieldRegister(
                        keyboardType = null,
                        controller = nameController,
                        returnText = "please enter the username",
                        labelText = "Name",
                        icon = Icons.account_circle),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  Container(
                      // height: ((height - status)) * 0.07,
                      width: width,
                      child: customTextFormFieldRegister(
                          keyboardType = TextInputType.emailAddress,
                          controller = emailController,
                          returnText = "please enter the email",
                          labelText = "Email",
                          icon = Icons.lock)),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  Container(
                    // height: ((height - status)) * 0.07,
                    width: width,
                    child: customTextFormFieldRegister(
                        keyboardType = TextInputType.phone,
                        controller = mobileController,
                        returnText = "please enter the mobile number",
                        labelText = "Mobile no",
                        icon = Icons.phone),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  // TextFormField(
                  //   controller: passwordController,
                  //   decoration: InputDecoration(labelText: "hello"),
                  // ),
                  Visibility(
                    visible: storingForVisible == '' ? true : false,
                    child: Column(
                      children: [
                        Container(
                          // height: ((height - status)) * 0.07,
                          width: width,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            obscureText: secureText,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "please enter password";
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                color: Colors.white,
                                icon: secureText
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    secureText = !secureText;
                                  });
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                borderSide: BorderSide(
                                    color: Colors.teal.shade300, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                borderSide: BorderSide(
                                    color: Colors.teal.shade300, width: 1),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ((height - status)) * 0.03,
                        ),
                        Container(
                            // height: ((height - status)) * 0.07,
                            width: width,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              obscureText: secureText1,
                              controller: confirmPasswordController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter repassword";
                                }
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  return "password does not match";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  color: Colors.white,
                                  icon: secureText1
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      secureText1 = !secureText1;
                                    });
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0)),
                                  borderSide: BorderSide(
                                      color: Colors.teal.shade300, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0)),
                                  borderSide: BorderSide(
                                      color: Colors.teal.shade300, width: 1),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.01,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.white,
                      ),
                      child: CheckboxListTile(
                        activeColor: Colors.teal,
                        checkColor: Colors.white,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          'Existing Family Member',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: _selected,
                        onChanged: (value) => setState(() => _selected = value),
                      ),
                    ),
                  ),
                  if (!_selected)
                    Container(
                        // height: ((height - status)) * 0.07,
                        width: width,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "please enter Familyname";
                            } else {
                              return null;
                            }
                          },
                          controller: familyNameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              borderSide: BorderSide(
                                  color: Colors.teal.shade300, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              borderSide: BorderSide(
                                  color: Colors.teal.shade300, width: 1),
                            ),
                            prefixIcon: Icon(
                              Icons.family_restroom,
                              color: Colors.white,
                            ),
                            labelText: "FamilyName",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
                  if (_selected)
                    Container(
                      // height: ((height - status)) * 0.07,
                      width: width,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: familyIdController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                            borderSide: BorderSide(
                                color: Colors.teal.shade300, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                            borderSide: BorderSide(
                                color: Colors.teal.shade300, width: 1),
                          ),
                          prefixIcon: Icon(
                            Icons.family_restroom_sharp,
                            color: Colors.white,
                          ),
                          labelText: "FamilyId",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: ((height - status)) * 0.03,
                  ),
                  // customTextFormFieldRegister(
                  //   keyboardType = null,
                  //   controller = familyNameController,
                  //   returnText = "please enter Family name",
                  //   labelText = "Family Name",
                  // ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.white,
                      ),
                      child: CheckboxListTile(
                        activeColor: Colors.teal,
                        checkColor: Colors.white,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          'I agree with Terms & Condition',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: isChecked,
                        onChanged: (value) => setState(() => isChecked = value),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      var f = formKey.currentState.validate();
                      // print(470);
                      // print(nameController.text);
                      // print(emailController.text);
                      // print(correctFacebookId);
                      // print(mobileController.text);
                      // print(correctGoogleId);
                      // print(correctProfileImage);
                      // print(passwordController);
                      // print(familyNameController.text);
                      // print(familyIdController.text);
                      // print(confirmPasswordController);
                      // print(478);
                      apiRegisterPageToPost();
                    },
                    child: Container(
                      height: (height - status) * 0.07,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue.shade900,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ((height - status)) * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      height: ((height - status)) * 0.06,
                      width: width,
                      child: Center(
                        child: Text(
                          'Already have an account? Sign In',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text(''),
                    onPressed: () {
                      clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
