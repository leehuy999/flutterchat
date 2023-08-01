// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:signinfirebase/modules/login/screens/signinpage.dart';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _confirmpasswordTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confirmpasswordTextEditingController = TextEditingController();
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
                  image: AssetImage('assets/signup.jpg'),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.only(right: 180, bottom: 20),
                child: Text(
                  'Sign Up',
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
                    padding: EdgeInsets.only(right: 10,top: 15,),
                    child: Container(
                      height: 24,
                      width: 24,
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
                      controller: _emailTextEditingController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        labelText: 'Email',
                          contentPadding: EdgeInsets.only(top: 8, bottom: 8)
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
                      height: 24,
                      width: 24,
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
                      controller: _passwordTextEditingController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),

                        labelText: 'Password',
                          contentPadding: EdgeInsets.only(top: 8, bottom: 8)
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
                      height: 24,
                      width: 24,
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
                      controller: _confirmpasswordTextEditingController,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                          contentPadding: EdgeInsets.only(top: 8, bottom: 8)
                        // prefixIcon: Image(image: AssetImage('assets/mail.png'),)
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 32,
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * (5 / 6),
                child: RichText(
                  text: TextSpan(
                    text: 'By signing up,you agree to our? ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Term & Conditions ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 15),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => signuppage()))),
                      TextSpan(
                        text: 'and ',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontSize: 15),
                      ),
                      TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 15),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => signuppage()))),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 14,
              // ),
              // RichText(
              //   text: TextSpan(
              //     text: 'By signing up,you agree to our? ',
              //     style: TextStyle(
              //         fontWeight: FontWeight.normal,
              //         color: Colors.grey,
              //         fontSize: 14),
              //     children: <TextSpan>[
              //       TextSpan(
              //           text: "Term & Conditions",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               color: Colors.blue,
              //               fontSize: 14),
              //           recognizer: TapGestureRecognizer()
              //             ..onTap = () => Navigator.of(context).push(
              //                 MaterialPageRoute(
              //                     builder: (context) => signuppage()))),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(right: 200),
              //   child: RichText(
              //     text: TextSpan(
              //       text: 'and ',
              //       style: TextStyle(
              //           fontWeight: FontWeight.normal,
              //           color: Colors.grey,
              //           fontSize: 14),
              //       children: <TextSpan>[
              //         TextSpan(
              //             text: "Privacy Policy",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.blue,
              //                 fontSize: 14),
              //             recognizer: TapGestureRecognizer()
              //               ..onTap = () => Navigator.of(context).push(
              //                   MaterialPageRoute(
              //                       builder: (context) => signuppage()))),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 32,
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
                        var email = _emailTextEditingController.text;
                        var password = _passwordTextEditingController.text;
                        var confirmpassword =
                            _confirmpasswordTextEditingController.text;
                        //  check null
                        //  check gmail có @
                        //  check pass = confirmpass
                        if (email == "" ||
                            password == "" ||
                            confirmpassword == "") {
                          SVProgressHUD.showError(
                              status: 'Please fill enough info');
                          return;
                        }
                        ;
                        if (!email.contains('@')) {
                          SVProgressHUD.showError(
                              status: 'Please fill correct gmail');
                          return;
                        }
                        ;
                        if (password != confirmpassword) {
                          SVProgressHUD.showError(
                              status: 'Confirm password not correct');
                          return;
                        }
                        ;
                        try {
                          SVProgressHUD.show();
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          FirebaseAuth.instance.currentUser
                              ?.sendEmailVerification();
                          // var acs = ActionCodeSettings(
                          //   // URL you want to redirect back to. The domain (www.example.com) for this
                          //   // URL must be whitelisted in the Firebase Console.
                          //     url: 'https://google.com',
                          //     // This must be true
                          //     handleCodeInApp: true,
                          //     iOSBundleId: 'com.example.signinfirebase',
                          //     androidPackageName: 'com.example.signinfirebase',
                          //     // installIfNotAvailable
                          //     androidInstallApp: true,
                          //     // minimumVersion
                          //     androidMinimumVersion: '12');
                          // await FirebaseAuth.instance.sendSignInLinkToEmail(email: email, actionCodeSettings: acs);
                          SVProgressHUD.dismiss();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            SVProgressHUD.showError(
                                status: 'The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            SVProgressHUD.showError(
                                status:
                                    'The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))),
              // Container(
              //   // color: Colors.yellow,
              //   width: 140, height: 50,
              //   decoration: BoxDecoration(
              //     color: Colors.black,
              //     borderRadius: BorderRadius.circular(16),),
              //   child: Text("Button", style: TextStyle(color: Colors.white),),
              // ),
              SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                  text: 'Joined us before? ',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()))),
                  ],
                ),
              ),
              SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }
}
