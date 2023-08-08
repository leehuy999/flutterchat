import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signinfirebase/managers/MessageManager.dart';
import 'package:signinfirebase/modules/chat/controllers/BoxChatController.dart';
import 'package:signinfirebase/modules/chat/models/LatestMessageModel.dart';

import '../models/Message.dart';

class BoxChatScreen extends StatefulWidget {
  LatestMessageModel latestMessageModel;

  BoxChatScreen(this.latestMessageModel);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BoxChatScreenState();
  }
}

class BoxChatScreenState extends State<BoxChatScreen> {
  late TextEditingController _textController;
  late BoxChatController _boxChatController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _boxChatController = Get.put(BoxChatController(),
        tag: widget.latestMessageModel.userModel.id);
    _boxChatController.initController(widget.latestMessageModel.userModel.id);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: Container(
                    padding: EdgeInsets.only(top: 16, bottom: 0),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // build header box chat
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back_ios)),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(17),
                                    child: Image.network(
                                      widget.latestMessageModel.userModel
                                          .avatar ??
                                          "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "${widget.latestMessageModel.userModel.name}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container()
                          ],
                        ),
                        Expanded(child: Obx(() =>
                        _boxChatController.isLoading.value ? Container(
                          child: Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        ) : Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                              itemCount: _boxChatController.listMessages.value
                                  .length,
                              itemBuilder: (BuildContext ctx, int idx) {
                                return Text(
                                    _boxChatController.listMessages.value[idx]
                                        .messageContent);
                              }),
                        ))),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _textController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Type something',
                                      contentPadding: EdgeInsets.only(
                                          top: 8, bottom: 8, left: 8, right: 8)
                                    // prefixIcon: Image(image: AssetImage('assets/mail.png'),)
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    var msgText = _textController.text.trim();
                                    if (msgText.length == 0) {
                                      return;
                                    }
                                    Message msg = Message(FirebaseAuth.instance.currentUser!.uid, msgText, DateTime.now().millisecondsSinceEpoch/1000);
                                    MessageManager.insertMessage(FirebaseAuth.instance.currentUser!.uid, widget.latestMessageModel.userModel.id, msg);

                                    MessageManager.insertMessage( widget.latestMessageModel.userModel.id, FirebaseAuth.instance.currentUser!.uid, msg);

                                  },
                                  icon: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.blue),
                                        borderRadius:
                                        BorderRadius.circular(24)),
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    )))));
  }
}
