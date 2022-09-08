import 'package:flutter_app_chat_c6_alex/model/my_user.dart';

abstract class RegisterNavigator{
  void showLoading();
  void hideLoading();
  void showMessage(String message);
  void goToHome(MyUser user);
}