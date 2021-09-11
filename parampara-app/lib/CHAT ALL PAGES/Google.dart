// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:googleandfacebook/SHARED%20PREFERENCES/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'const.dart';
// import 'home.dart';
// import 'model/user_chat.dart';
// import 'widget/loading.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   LoginScreenState createState() => LoginScreenState();
// }

// class LoginScreenState extends State<LoginScreen> {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   SharedPreferences prefs;

//   bool isLoading = false;
//   bool isLoggedIn = false;
//   User currentUser;
//   var firebaseUser;
//   String userName;
//   String email;
//   String profileImage;
//   @override
//   void initState() {
//     super.initState();
//     checkingFirebaseFirestoreDatabase();
//   }

//   checkingFirebaseFirestoreDatabase() async {
//     Shared().shared().then((value) {
//       List<String> storingData = value.getStringList('storeData');
//       List<String> storingIdAndImage = value.getStringList('idAndProfileImage');
//       String storingFirebaseUser = value.getString('firebaseUserName');

//       setState(() {
//         firebaseUser = storingFirebaseUser;
//         userName = storingData[0];
//         email = storingData[1];
//         profileImage = storingIdAndImage[1];
//       });
//     }).whenComplete(() async {
//       if (firebaseUser != null) {
//         QuerySnapshot result = await FirebaseFirestore.instance
//             .collection('users')
//             .where('id', isEqualTo: firebaseUser)
//             .get();
//         // Check is already sign up
//         // final QuerySnapshot result = await FirebaseFirestore.instance
//         //       .collection('users')
//         //       .where('id', isEqualTo: firebaseUser.)
//         //       .get();
//         final List<DocumentSnapshot> documents = result.docs;
//         if (documents.length == 0) {
//           // Update data to server if new user
//           // FirebaseFirestore.instance
//           //     .collection('users')
//           //     .doc(firebaseUser.uid)
//           //     .set({
//           //   'nickname': firebaseUser.displayName,
//           //   'photoUrl': firebaseUser.photoURL,
//           //   'id': firebaseUser.uid,
//           //   'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
//           //   'chattingWith': null
//           // });
//           FirebaseFirestore.instance.collection('users').doc(firebaseUser).set({
//             'nickname': userName,
//             'photoUrl': profileImage,
//             'id': firebaseUser,
//             'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
//             'chattingWith': null
//           });

//           // Write data to local
//           // currentUser = firebaseUser;
//           // await prefs?.setString('id', currentUser.uid);
//           // await prefs?.setString('nickname', currentUser.displayName ?? "");
//           // await prefs?.setString('photoUrl', currentUser.photoURL ?? "");
//           currentUser = firebaseUser;
//           Shared().shared().then((value) {
//             value.setString('nickname', userName ?? "");
//             value.setString('id', firebaseUser);
//             value.setString('photoUrl', currentUser.photoURL ?? "");
//           });
//         } else {
//           DocumentSnapshot documentSnapshot = documents[0];
//           UserChat userChat = UserChat.fromDocument(documentSnapshot);
//           // Write data to local
//           await prefs?.setString('id', userChat.id);
//           await prefs?.setString('nickname', userChat.nickname);
//           await prefs?.setString('photoUrl', userChat.photoUrl);
//           await prefs?.setString('aboutMe', userChat.aboutMe);
//         }
//         Fluttertoast.showToast(msg: "Sign in success");
//         this.setState(() {
//           isLoading = false;
//         });

//         // Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //         builder: (context) =>
//         //             ChatHomeScreen(currentUserId: firebaseUser)));
//       } else {
//         Fluttertoast.showToast(msg: "Sign in fail");
//         this.setState(() {
//           isLoading = false;
//         });
//       }
//       // } else {
//       //   Fluttertoast.showToast(msg: "Can not init google sign in");
//       //   this.setState(() {
//       //     isLoading = false;
//       //   });
//       // }
//     });
//   }

//   // void isSignedIn() async {
//   //   this.setState(() {
//   //     isLoading = true;
//   //   });

//   //   prefs = await SharedPreferences.getInstance();

//   //   isLoggedIn = await googleSignIn.isSignedIn();
//   //   if (isLoggedIn && prefs?.getString('id') != null) {
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(
//   //           builder: (context) =>
//   //               HomeScreen(currentUserId: prefs.getString('id') ?? "")),
//   //     );
//   //   }

//   //   this.setState(() {
//   //     isLoading = false;
//   //   });
//   // }

//   // Future<Null> handleSignIn() async {
//   //   prefs = await SharedPreferences.getInstance();

//   //   this.setState(() {
//   //     isLoading = true;
//   //   });

//   // GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//   // if (googleUser != null) {
//   //   GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
//   //   final AuthCredential credential = GoogleAuthProvider.credential(
//   //     accessToken: googleAuth.accessToken,
//   //     idToken: googleAuth.idToken,
//   //   );

//   // User? firebaseUser =
//   //     (await firebaseAuth.signInWithCredential(credential)).user;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Chat',
//             style: TextStyle(color: primaryColor),
//           ),
//           //title: Text(
//           //   // widget.title,
//           //   style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
//           // ),
//           // centerTitle: true,
//         ),
//         body: Stack(
//           children: <Widget>[
//             // Center(
//             //   child: TextButton(
//             //     onPressed: () => handleSignIn().catchError((err) {
//             //       Fluttertoast.showToast(msg: err.toString());
//             //       this.setState(() {
//             //         isLoading = false;
//             //       });
//             //     }),
//             //     child: Text(
//             //       'SIGN IN WITH GOOGLE',
//             //       style: TextStyle(fontSize: 16.0, color: Colors.white),
//             //     ),
//             //     style: ButtonStyle(
//             //         backgroundColor:
//             //             MaterialStateProperty.all<Color>(Color(0xffdd4b39)),
//             //         padding: MaterialStateProperty.all<EdgeInsets>(
//             //             EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0))),
//             //   ),

//             // Loading
//             Positioned(
//               child: isLoading ? const Loading() : Container(),
//             ),
//           ],
//         ));
//   }
// }
