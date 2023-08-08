import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signinfirebase/managers/LatestMessageManager.dart';
import 'package:signinfirebase/modules/chat/controllers/ChatController.dart';
import 'package:signinfirebase/modules/chat/models/LatestMessage.dart';

import '../../../helpers/utils.dart';
import 'BoxChatScreen.dart';

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
    _chatController.initController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // _usernameController.text = "PjofWOzpl6U64FASbhPmm2Ssptd2";

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
              var userId = _usernameController.text.trim();
              var firstMsg = _firstMsgController.text.trim();
              var latestMessage = LatestMessage(userId, firstMsg, DateTime.now().millisecondsSinceEpoch/1000);
              // insert dữ liệu vào cây user id hiện tại
              LatestMessageManager.insertLatestMessage(FirebaseAuth.instance.currentUser!.uid, userId, latestMessage);
              // insert dữ liệu vào cây user id của người được chat
              latestMessage.userId = FirebaseAuth.instance.currentUser!.uid;
              LatestMessageManager.insertLatestMessage(userId, FirebaseAuth.instance.currentUser!.uid, latestMessage);
          },
          child: Container(
            width: 130,
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text("Send message"),
            ),
          ),),
          SizedBox(height: 50,),
          Expanded(child: Obx(()=>ListView.builder(
              shrinkWrap: true,
              itemCount: _chatController.listLatestMessages.value.length,
              itemBuilder: (BuildContext ctx, int idx) {
                return GestureDetector(
                  onTap: (){
                    Get.to(BoxChatScreen(_chatController.listLatestMessages.value[idx]));
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(_chatController.listLatestMessages.value[idx].userModel.avatar??"", fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("${_chatController.listLatestMessages.value[idx].userModel.name}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                              ),),
                            SizedBox(height: 8,),
                            Text("${_chatController.listLatestMessages.value[idx].latestMessage} .  ${readTimestamp((_chatController.listLatestMessages.value[idx].timestamp).toInt())}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
          )))
        ],
      ),
    ))));
  }


}