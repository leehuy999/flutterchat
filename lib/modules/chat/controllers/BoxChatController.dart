import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:signinfirebase/managers/MessageManager.dart';

import '../models/Message.dart';

class BoxChatController extends GetxController {

  var isLoading = true.obs;

  var listMessages = <Message>[].obs;

  void initController(String userId) async{
    var listMessagesData = await MessageManager.getListMessageByUserId(FirebaseAuth.instance.currentUser!.uid, userId);
    listMessages.value = listMessagesData;
    isLoading.value = false;
    listenRealtimeMsg(userId);
  }

  void listenRealtimeMsg(String userId) {
    FirebaseDatabase.instance.ref().child("Message").child(FirebaseAuth.instance.currentUser!.uid).child(userId).onChildAdded.listen((event) async{
      print("${event.snapshot.value}");
      var dataMap = Map<String, dynamic>.from(event.snapshot.value as Map);
      // listRes = List<LatestMessage>.from(dataMap.map((k, e) => LatestMessage.fromJson(Map<String, dynamic>.from(e))));
      var msg = Message.fromJson(Map<String, dynamic>.from(dataMap));
      if (listMessages.value.indexWhere((e)=>e.timestamp == msg.timestamp) < 0) {
        listMessages.value.add(msg);
        listMessages.refresh();

      }
    });
    //n7i78Hut8Oazha72AfB9eZ9qAIF3
    //47t7QOPgPBRcPGmvEez9rK5WItC2
  }
}