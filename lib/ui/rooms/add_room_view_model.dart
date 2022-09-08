import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/database/database_utils.dart';
import 'package:flutter_app_chat_c6_alex/ui/rooms/add_room_navigator.dart';

class AddRoomViewModel extends ChangeNotifier{
  late AddRoomNavigator navigator ;
  void createRoom(String roomTitle, String roomDescription, String categoryId)async{
    navigator.showLoading();
    try{
      var room = await DataBaseUtils.createRoomFromFireStore(roomTitle, roomDescription, categoryId);
      navigator.hideLoading();
      navigator.showMessage('Room created Successfully');
    }catch(error){
      navigator.hideLoading();
      navigator.showMessage(error.toString());
    }

  }
}