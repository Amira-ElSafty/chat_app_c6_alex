import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/firebase_errors.dart';
import 'package:flutter_app_chat_c6_alex/ui/register/register_navigator.dart';

// provider
class RegisterViewModel extends ChangeNotifier {
  late RegisterNavigator navigator ;

  void registerFireBaseAuth(String email , String password)async{
      // logic
    // show loading
    navigator.showLoading();
      try {
        final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        navigator.hideLoading();
        navigator.showMessage('Register successfully');
        navigator.navigatorToHomeScreen();
        // hide loading
        // show message
        print('id:${result.user?.uid}');
        // user register
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseErrors.weakPassword) {
          navigator.hideLoading();
          navigator.showMessage('The password provided is too weak.');
          // hide loading
          // show message ;
          // error
          print('The password provided is too weak.');
        } else if (e.code == FirebaseErrors.emailInUse) {
          navigator.hideLoading();
          navigator.showMessage('The account already exists for that email.');
          // hide loading
          // show message
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }



}