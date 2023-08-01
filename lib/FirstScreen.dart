// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:signinfirebase/MainScreen.dart';
import 'package:signinfirebase/models/UserModel.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  final database = FirebaseDatabase.instance.ref();
  late TextEditingController _nameTextEditingController;

  DateTime? _selectedDateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     var dailySpecialRef = FirebaseDatabase.instance.ref().child("/dailySpecicalRef/");
    _nameTextEditingController = TextEditingController();
  }

  Widget build(BuildContext context) {
    // final dailySpecialRef = database.child("/dailySpecicalRef/");
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child:  Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Text(
                    "Welcome to my app!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  width: 300,
                  child: TextField(
                    controller: _nameTextEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Your name",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                _selectedDateTime == null?GestureDetector(
                  onTap: () async{
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(DateTime.now().year - 18),
                    );
                    if (picked != null && picked != _selectedDateTime)
                      setState(() {
                        _selectedDateTime = picked;
                      });
                  },
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*2/3,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Center(
                        child: Text("Select your birthday",
                          style: TextStyle(color: Colors.white),),
                      )
                  ),
                ):Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Your Birthday: ${ DateFormat('yyyy-MM-dd').format(_selectedDateTime!)}"),
                    SizedBox(width: 16,),
                    GestureDetector(
                      onTap: () async{
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(DateTime.now().year - 18),
                        );
                        if (picked != null && picked != _selectedDateTime)
                        setState(() {
                          _selectedDateTime = picked;
                        });
                      },
                      child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Center(
                            child: Text("Edit",
                              style: TextStyle(color: Colors.white),),
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async{
                        var name = _nameTextEditingController.text.trim();
                        if (name == ""  || _selectedDateTime == null) {
                          SVProgressHUD.showError(
                              status: 'Please fill correct your information');
                          return;
                        }
                        if (name == "") {
                          SVProgressHUD.showError(
                              status: 'Please fill correct your name');
                          return;
                        }
                        if (_selectedDateTime == null ) {
                          SVProgressHUD.showError(
                              status: 'Please slecet your birthday');
                          return;
                        }
                        SVProgressHUD.show();
                        var birthDay = _selectedDateTime!.millisecondsSinceEpoch/1000;
                        var ref = FirebaseDatabase.instance.ref("Users/${FirebaseAuth.instance.currentUser?.uid}");
                        UserModel _currentUser = UserModel("${FirebaseAuth.instance.currentUser?.uid}", name, birthDay);
                        _currentUser.avatar = "https://kynguyenlamdep.com/wp-content/uploads/2022/06/anh-gai-xinh-cuc-dep.jpg";
                        await ref.set(_currentUser.toJson());
                        SVProgressHUD.dismiss();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      },
                      child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Center(
                            child: Text("Next",
                              style: TextStyle(color: Colors.white),),
                          )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
