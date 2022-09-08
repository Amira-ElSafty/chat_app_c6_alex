import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/database/database_utils.dart';
import 'package:flutter_app_chat_c6_alex/firebase_errors.dart';
import 'package:flutter_app_chat_c6_alex/ui/login/Login_navigator.dart';

class LoginViewModel extends ChangeNotifier{
  late LoginNavigator navigator  ;
  // logic login
  void loginUserInFireBaseAuth(String email , String password) async{
    // show loading
    navigator.showLoading();
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      var userObject = await DataBaseUtils.readUser(result.user?.uid ?? '');
      if(userObject == null){
        navigator.hideLoading();
        navigator.showMessage('Login with failed try again ');
      }else {
        navigator.hideLoading();
        navigator.showMessage('Login Successfully');
        navigator.navigatorToHome();
      }
      print('id: ${result.user?.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.userNotFound) {
        navigator.hideLoading();
        navigator.showMessage('No user found for that email.');
        // hide loading
        // show message
        print('No user found for that email.');
      } else if (e.code == FirebaseErrors.wrongPassword) {
        navigator.hideLoading();
        navigator.showMessage('Wrong password provided for that user.');
        // hide loading
        // show message
        print('Wrong password provided for that user.');
      }
    }
  }


}