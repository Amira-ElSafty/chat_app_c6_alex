import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/chat/chat_screen.dart';
import 'package:flutter_app_chat_c6_alex/providers/user_provider.dart';
import 'package:flutter_app_chat_c6_alex/ui/home/home_screen.dart';
import 'package:flutter_app_chat_c6_alex/ui/login/login_screen.dart';
import 'package:flutter_app_chat_c6_alex/ui/register/register_screen.dart';
import 'package:flutter_app_chat_c6_alex/ui/rooms/add_room.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ],
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return MaterialApp(
      title: 'Chat App',
      routes: {
        RegisterScreen.routeName : (context) => RegisterScreen(),
        LoginScreen.routeName : (context) => LoginScreen(),
        HomeScreeen.routeName : (context) => HomeScreeen(),
        AddRoom.routeName : (context) => AddRoom(),
        ChatScreen.routeName: (context) => ChatScreen(),
      },
      initialRoute: userProvider.firebaseUser == null ?LoginScreen.routeName:HomeScreeen.routeName
    );
  }
}
