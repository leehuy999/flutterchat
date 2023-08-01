import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  final database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    final dailySpecialRef = database.child("/dailySpecicalRef/");
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100,width: 100,
          // child: Stack(
          //   fit: StackFit.expand,
          //   children: [
          //     CircleAvatar(backgroundImage: AssetImage(''),)
          //   ],
          // ),
          )
        ],
      ),
    );
  }
}
