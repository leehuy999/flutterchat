import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height/2,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Image(
                  image: AssetImage('assets/forgot.jpg'),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
