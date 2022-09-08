import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/model/my_user.dart';
import 'package:flutter_app_chat_c6_alex/providers/user_provider.dart';
import 'package:flutter_app_chat_c6_alex/ui/home/home_screen.dart';
import 'package:flutter_app_chat_c6_alex/ui/login/login_screen.dart';
import 'package:flutter_app_chat_c6_alex/ui/register/register_navigator.dart';
import 'package:flutter_app_chat_c6_alex/ui/register/register_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_chat_c6_alex/utils.dart' as Utils;
class RegisterScreen extends StatefulWidget {
  static String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> implements RegisterNavigator {
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String userName = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RegisterViewModel viewModel = RegisterViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this ;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
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
              title: Text('Create Account'),
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
                          labelText: 'First Name '
                        ),
                        onChanged: (text){
                          firstName = text ;
                        },
                        validator: (text){
                          if(text== null || text.trim().isEmpty){
                            return ' Please enter first name';
                          }
                          return null ;
                        },

                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Last Name '
                        ),
                        onChanged: (text){
                          lastName = text ;
                        },
                        validator: (text){
                          if(text== null || text.trim().isEmpty){
                            return ' Please enter last name';
                          }
                          return null ;
                        },

                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'User Name '
                        ),
                        onChanged: (text){
                          userName = text ;
                        },
                        validator: (text){
                          if(text== null || text.trim().isEmpty){
                            return ' Please enter user name';
                          }
                          return null ;
                        },

                      ),
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
                          child: Text('Register'),
                      ),
                      SizedBox(height: 20,),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed(LoginScreen.routeName);
                          },
                          child: Text("Have an account",
                            textAlign: TextAlign.start,
                          ),
                      )

                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
  void validateForm(){
    if(formKey.currentState?.validate() == true){
      // logic register
      // call view model w send email , password to make register
      viewModel.registerFireBaseAuth(email, password,firstName,lastName,userName);
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
      print('in show message');
      Navigator.pop(context);
      // other solution by ziad
      // Navigator.of(context).pushNamed(HomeScreeen.routeName);
    });
  }

  @override
  void goToHome(MyUser user) {
    var provider = Provider.of<UserProvider>(context , listen: false);
    provider.user = user ;
    Timer(Duration(milliseconds: 5000),(){
      Navigator.of(context).pushNamed(HomeScreeen.routeName);
    });
  }
}
