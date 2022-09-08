import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/database/database_utils.dart';
import 'package:flutter_app_chat_c6_alex/model/room.dart';
import 'package:flutter_app_chat_c6_alex/ui/home/home_navigator.dart';

class HomeScreenViewModel extends ChangeNotifier{
  List<Room> rooms = [];
  late HomeNavigator navigator ;

//   HomeScreenViewModel(){
//   getRooms();
// }

  void getRooms()async{
    rooms = await DataBaseUtils.getRooms();
  }
}