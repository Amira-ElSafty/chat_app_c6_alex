import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/ui/register/register_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      routes: {
        RegisterScreen.routeName : (context) => RegisterScreen(),
      },
      initialRoute: RegisterScreen.routeName,
    );
  }
}
