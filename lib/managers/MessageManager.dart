import 'package:firebase_database/firebase_database.dart';
import 'package:signinfirebase/modules/chat/models/LatestMessage.dart';

import '../modules/chat/models/Message.dart';

class MessageManager {
  static void insertMessage(String userFromId, String userToId, Message message) {
    var key = FirebaseDatabase.instance.ref().child("Message").child(userFromId).child(userToId).push().key;
    FirebaseDatabase.instance.ref().child("Message").child(userFromId).child(userToId).child(key!).set(message.toJson());

  }

  static Future<List<Message>> getListMessageByUserId(String userFromId, String userToId) async{
    var listRes = <Message>[];
    var dataSnapshot = await FirebaseDatabase.instance.ref().child("Message").child(userFromId).child(userToId).get();
    if (dataSnapshot.exists) {
      print("DATA SNAPSHOT ${dataSnapshot.value}");
      var dataMap = Map<String, dynamic>.from(dataSnapshot.value as Map);
      // listRes = List<LatestMessage>.from(dataMap.map((k, e) => LatestMessage.fromJson(Map<String, dynamic>.from(e))));
      dataMap.forEach((key, value) {
        listRes.add(Message.fromJson(Map<String, dynamic>.from(value)));
      });
    }
    return listRes;
  }
}