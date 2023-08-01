import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:signinfirebase/managers/LatestMessageManager.dart';
import 'package:signinfirebase/managers/UserModelManager.dart';
import 'package:signinfirebase/modules/chat/models/LatestMessage.dart';
import 'package:signinfirebase/modules/chat/models/LatestMessageModel.dart';

class ChatController extends GetxController {

  var isLoading = true.obs;

  var listLatestMessages = <LatestMessageModel>[].obs;

  void initController() async{
    // load data from firebase
    var latestMessageList = await LatestMessageManager.getLatestMessageByUserId(FirebaseAuth.instance.currentUser!.uid);
    // set isLoading = false;
    for (var i = 0; i < latestMessageList.length; i++) {

      var latestMsg = latestMessageList[i];
      if (listLatestMessages.value.indexWhere((e)=>e.userModel.id == latestMsg.userId) < 0) {
        var user = await UserModelManager.getUserById(latestMsg.userId);
        listLatestMessages.add(LatestMessageModel(user!, latestMsg.latestMessage, latestMsg.timestamp));
      }
    }
    print("Data ${listLatestMessages.value.length}");
    isLoading.value = false;
    listenRealtimeLatestMsg();
  }

  void listenRealtimeLatestMsg() {
    FirebaseDatabase.instance.ref().child("LatestMessage").child(FirebaseAuth.instance.currentUser!.uid).onChildAdded.listen((event) async{
      print("${event.snapshot.value}");
      var dataMap = Map<String, dynamic>.from(event.snapshot.value as Map);
      // listRes = List<LatestMessage>.from(dataMap.map((k, e) => LatestMessage.fromJson(Map<String, dynamic>.from(e))));
      var latestMsg = LatestMessage.fromJson(Map<String, dynamic>.from(dataMap));
      if (listLatestMessages.value.indexWhere((e)=>e.userModel.id == latestMsg.userId) < 0) {
        var user = await UserModelManager.getUserById(latestMsg.userId);
        listLatestMessages.value.add(LatestMessageModel(user!, latestMsg.latestMessage, latestMsg.timestamp));
        listLatestMessages.refresh();

      }
    });
    //n7i78Hut8Oazha72AfB9eZ9qAIF3
    //47t7QOPgPBRcPGmvEez9rK5WItC2
  }

}