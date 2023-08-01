import 'package:firebase_database/firebase_database.dart';
import 'package:signinfirebase/modules/chat/models/LatestMessage.dart';

class LatestMessageManager {
  static void insertLatestMessage(String userFromId, String userToId, LatestMessage latestMessage) {
    FirebaseDatabase.instance.ref().child("LatestMessage").child(userFromId).child(userToId).set(latestMessage.toJson());
  }

  static Future<List<LatestMessage>> getLatestMessageByUserId(String userFromId) async{
    var listRes = <LatestMessage>[];
    var dataSnapshot = await FirebaseDatabase.instance.ref().child("LatestMessage").child(userFromId).get();
    if (dataSnapshot.exists) {
      print("DATA SNAPSHOT ${dataSnapshot.value}");
      var dataMap = Map<String, dynamic>.from(dataSnapshot.value as Map);
       // listRes = List<LatestMessage>.from(dataMap.map((k, e) => LatestMessage.fromJson(Map<String, dynamic>.from(e))));
      dataMap.forEach((key, value) {
        listRes.add(LatestMessage.fromJson(Map<String, dynamic>.from(value)));
      });
    }
    return listRes;
  }
}