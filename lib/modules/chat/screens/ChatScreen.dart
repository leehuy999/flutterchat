import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signinfirebase/managers/LatestMessageManager.dart';
import 'package:signinfirebase/modules/chat/controllers/ChatController.dart';
import 'package:signinfirebase/modules/chat/models/LatestMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatScreenState();
  }

}

class ChatScreenState extends State<ChatScreen> {

  late TextEditingController _usernameController;
  late TextEditingController _firstMsgController;

  ChatController _chatController = Get.put(ChatController());

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _firstMsgController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _usernameController.text = "PjofWOzpl6U64FASbhPmm2Ssptd2";
    _chatController.initController();
    return  MaterialApp(
        home: Scaffold(
          body:SafeArea(child: Container(
            padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
                labelText: 'Username',
                contentPadding: EdgeInsets.only(top: 8, bottom: 8)
              // prefixIcon: Image(image: AssetImage('assets/mail.png'),)
            ),
          ),
          TextField(
            controller: _firstMsgController,
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
                labelText: 'First msg',
                contentPadding: EdgeInsets.only(top: 8, bottom: 8)
              // prefixIcon: Image(image: AssetImage('assets/mail.png'),)
            ),
          ),
          GestureDetector(onTap: (){
              var username = _usernameController.text.trim();
              var firstMsg = _firstMsgController.text.trim();
              var latestMessage = LatestMessage(username, firstMsg, DateTime.now().millisecondsSinceEpoch/1000);
              LatestMessageManager.insertLatestMessage(FirebaseAuth.instance.currentUser!.uid, username, latestMessage);
          },
          child: Container(
            width: 130,
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text("Send message"),
            ),
          ),),
          SizedBox(height: 50,)
        ],
      ),
    ))));
  }


}