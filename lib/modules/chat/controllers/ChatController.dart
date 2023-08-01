import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:signinfirebase/managers/LatestMessageManager.dart';
import 'package:signinfirebase/modules/chat/models/LatestMessage.dart';

class ChatController extends GetxController {

  var isLoading = true.obs;

  var listLatestMessages = <LatestMessage>[].obs;

  void initController() async{
    // load data from firebase
    listLatestMessages.value = await LatestMessageManager.getLatestMessageByUserId(FirebaseAuth.instance.currentUser!.uid);
    // set isLoading = false;
    print("Data ${listLatestMessages.value.length}");
    isLoading.value = false;
  }

}