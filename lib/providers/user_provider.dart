import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/database/database_utils.dart';
import 'package:flutter_app_chat_c6_alex/model/my_user.dart';

class UserProvider extends ChangeNotifier {
  MyUser? user;
  User? firebaseUser;

  UserProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    initMyUser();
  }
  void initMyUser() async {
    if (firebaseUser != null) {
      user = await DataBaseUtils.readUser(firebaseUser?.uid ?? '');
    }
  }
}
