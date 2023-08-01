import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:signinfirebase/models/UserModel.dart';

class LoggingUserController extends GetxController {

  var currentUser = UserModel("", "", 0.0).obs;

  void listenCurrentUserModel() {
    var stream = FirebaseDatabase.instance.ref("Users/${FirebaseAuth.instance.currentUser?.uid}").onValue;
    stream.listen((event) {
      if (event.snapshot.value != null) {
        currentUser.value =  UserModel.fromJson(Map<String, dynamic>.from(event.snapshot.value as Map));
      }
    });
  }
}