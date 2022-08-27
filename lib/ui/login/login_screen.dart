import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/ui/home/home_screen.dart';
import 'package:flutter_app_chat_c6_alex/ui/login/Login_navigator.dart';
import 'package:flutter_app_chat_c6_alex/ui/login/login_view_model.dart';
import 'package:flutter_app_chat_c6_alex/ui/register/register_screen.dart';
import 'package:flutter_app_chat_c6_alex/utils.dart' as Utils;


class LoginScreen extends StatefulWidget {
  static String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  String email = '';
  String password = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginViewModel viewModel = LoginViewModel();


  @override
  void initState() {
    super.initState();
    viewModel.navigator = this ;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset('assets/images/background_main.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Login'),
          ),
          body: Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email '
                      ),
                      onChanged: (text){
                        email = text ;
                      },

                      validator: (text){
                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text!);
                        if(text== null || text.trim().isEmpty){
                          return ' Please enter email';
                        }
                        if(!emailValid){
                          return ' please enter valid email ';
                        }
                        return null ;
                      },

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password'
                      ),
                      onChanged: (text){
                        password = text ;
                      },
                      validator: (text){
                        if(text== null || text.trim().isEmpty){
                          return ' Please enter password';
                        }
                        if(text.length < 6 ){
                          return 'password should be at least 6 chars.';
                        }
                        return null ;
                      },

                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: (){
                        validateForm();
                      },
                      child: Text('Login'),
                    ),
                    SizedBox(height: 20,),
                    TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed(RegisterScreen.routeName);
                        },
                        child: Text("Do'nt have an account ?"))
                  ],
                ),
              )
          ),
        ),
      ],
    );
  }
  validateForm(){
    if(formKey.currentState?.validate() == true){
      // login
      viewModel.loginUserInFireBaseAuth(email, password);
    }
  }

  @override
  void hideLoading() {
    Utils.hideLoading(context);
  }

  @override
  void showLoading() {
    Utils.showLoading(context, 'Loading...');
  }

  @override
  void showMessage(String message) {
    Utils.showMessage(context, message, 'OK', (context){
      Navigator.pop(context);
    });
  }

  @override
  void navigatorToHome() {
    Timer(Duration(seconds: 5),(){
      Navigator.of(context).pushNamed(HomeScreeen.routeName);
    });
  }
}
