import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/ui/home/home_screen.dart';
import 'package:flutter_app_chat_c6_alex/ui/login/login_screen.dart';
import 'package:flutter_app_chat_c6_alex/ui/register/register_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        LoginScreen.routeName : (context) => LoginScreen(),
        HomeScreeen.routeName : (context) => HomeScreeen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
