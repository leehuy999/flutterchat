// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';

import 'controllers/LoggingUserController.dart';
import 'modules/login/screens/signinpage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {

  late LoggingUserController _loggingUserController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loggingUserController = Get.put(LoggingUserController());
    _loggingUserController.listenCurrentUserModel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
      ),
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(()=>Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Container(
                              width: 70,
                              height: 70,
                              child: Image.network(_loggingUserController.currentUser.value.avatar??""),
                            ),
                          ),
                          Text("Hello, ${_loggingUserController.currentUser.value.name??""}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      )),
                      TextButton(onPressed: () async {
                        SVProgressHUD.show();
                        await FirebaseAuth.instance.signOut();
                        // Get.reset();
                        SVProgressHUD.dismiss();
                        Get.to(SignInPage());
                      }, child: Text("Logout")),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * (5 / 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black38,
                  ),
                  child: TextButton(onPressed: (){},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,width: 50,child: CircleAvatar(backgroundImage: AssetImage('assets/user.jpg'),),),
                        Padding(
                          padding:  EdgeInsets.only(left: 10),
                          child: Text('My account'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 140),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * (5 / 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black38,
                  ),
                  child: TextButton(onPressed: (){},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,width: 50,child: CircleAvatar(backgroundImage: AssetImage('assets/notification.png'),),),
                        Padding(
                          padding:  EdgeInsets.only(left: 10),
                          child: Text('Notifications'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 140),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * (5 / 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black38,
                  ),
                  child: TextButton(onPressed: (){},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,width: 50,child: CircleAvatar(backgroundImage: AssetImage('assets/setting.png'),),),
                        Padding(
                          padding:  EdgeInsets.only(left: 10),
                          child: Text('Setting'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 140),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * (5 / 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black38,
                  ),
                  child: TextButton(onPressed: (){},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,width: 50,child: CircleAvatar(backgroundImage: AssetImage('assets/help.png'),),),
                        Padding(
                          padding:  EdgeInsets.only(left: 10),
                          child: Text('Help Center'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 140),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * (5 / 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black38,
                  ),
                  child: TextButton(onPressed: (){},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,width: 50,child: CircleAvatar(backgroundImage: AssetImage('assets/logout.png'),),),
                        Padding(
                          padding:  EdgeInsets.only(left: 10),
                          child: Text('logout'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 140),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
