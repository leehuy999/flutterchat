import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:signinfirebase/FirstScreen.dart';
import 'package:signinfirebase/Forgot.dart';
import 'package:signinfirebase/MainScreen.dart';
import 'package:signinfirebase/modules/login/screens/signuppage.dart';

import '../../../managers/UserModelManager.dart';
import '../../chat/screens/ChatScreen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _emailTextEditingControler;
  late TextEditingController _passwordTextEditingControler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordTextEditingControler = TextEditingController();
    _emailTextEditingControler = TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage('assets/anh.jpg'),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.only(right: 220, bottom: 20),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 40),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Container(
                      height: 35,
                      width: 40,
                      child: Image(
                        image: AssetImage('assets/mail.png'),
                      ),
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 25,
                  //   backgroundImage: AssetImage('assets/mail.png'),
                  // ),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * (2 / 3),
                    child: TextField(
                      controller: _emailTextEditingControler,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        labelText: '   Email',
                        // prefixIcon: Image(image: AssetImage('assets/mail.png'),)
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Container(
                      height: 35,
                      width: 40,
                      child: Image(
                        image: AssetImage('assets/lockk.png'),
                      ),
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 25,
                  //   backgroundImage: AssetImage('assets/mail.png'),
                  // ),

                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * (2 / 3),
                    child: TextField(
                      controller: _passwordTextEditingControler,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        labelText: '   Password',
                        suffixIcon: Icon(Icons.remove_red_eye),
                        // prefixIcon: Image(image: AssetImage('assets/mail.png'),)
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgot(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.only(right: 35, top: 0, bottom: 25),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size(120, 16)),
                  ),
                ],
              ),
              Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * (5 / 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    // border: Border.all(),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      var email = _emailTextEditingControler.text;
                      var password = _passwordTextEditingControler.text;
                      //check null
                      //check k phải gmail
                      if (email == "" || password == "") {
                        SVProgressHUD.showError(
                            status: 'Please fill enough info');
                        return;
                      }
                      ;
                      if (!email.contains("@")) {
                        SVProgressHUD.showError(
                            status: 'Please fill correct email');
                        return;
                      }
                      ;
                      try {
                        SVProgressHUD.show();
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        SVProgressHUD.dismiss();
                        var userCheck = await UserModelManager.getUserById(
                            "${FirebaseAuth.instance.currentUser?.uid}");
                        if (userCheck == null) {
                          Get.to(FirstScreen());
                        } else {
                          Get.to(ChatScreen());
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          SVProgressHUD.showError(
                              status: 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          SVProgressHUD.showError(
                              status: 'Wrong password provided for that user.');
                        }
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22),
                    ),
                  )),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey,
                    ),
                Text(
                    "OR",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 18),
                  ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.grey,
                    ),
                  ],
                ),
                // Text(
                //   "---------------------------OR---------------------------",
                //   style: TextStyle(
                //       fontWeight: FontWeight.normal,
                //       color: Colors.brown,
                //       fontSize: 18),
                // ),
              ),
              RichText(
                text: TextSpan(
                  text: 'New to Logictics? ',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => signuppage())))
                  ],
                ),
              )
              // Container(
              //     height: 60,
              //     width: MediaQuery.of(context).size.width * (3 / 4),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       // border: Border.all(),
              //       color: Colors.blue,
              //     ),
              //     child: TextButton(
              //       onPressed: () {},
              //       child: Text(
              //         'Sign Up',
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //             fontSize: 22),
              //       ),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
