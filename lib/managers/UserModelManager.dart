import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/UserModel.dart';

class UserModelManager {
  static Future<UserModel?> getUserById(String id) async{
    var ref = FirebaseDatabase.instance.ref("Users");
    var dataSnapshot = await ref.child(id).get();
    if (dataSnapshot.exists) {
      var userModel = UserModel.fromJson(Map<String, dynamic>.from(dataSnapshot.value as Map));
      return userModel;
    }
    return null;
  }

  // static Future<UserModel?> getUserByName(String name) async{
  //   var ref = FirebaseDatabase.instance.ref("Users");
  //   var dataSnapshot = await ref.child(name).get();
  //   if (dataSnapshot.exists) {
  //     var userModel = UserModel.fromJson(Map<String, dynamic>.from(dataSnapshot.value as Map));
  //     return userModel;
  //   }
  //   return null;
  // }
}