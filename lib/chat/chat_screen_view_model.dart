import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/chat/chat_navigator.dart';
import 'package:flutter_app_chat_c6_alex/database/database_utils.dart';
import 'package:flutter_app_chat_c6_alex/model/message.dart';
import 'package:flutter_app_chat_c6_alex/model/my_user.dart';
import 'package:flutter_app_chat_c6_alex/model/room.dart';
import 'package:flutter_app_chat_c6_alex/providers/user_provider.dart';

class ChatScreenViewModel extends ChangeNotifier{
  late ChatNavigator navigator ;
  late Room room ;
  late MyUser? currentUser ;
  late Stream<QuerySnapshot<Message>> streamMessage ;

  void sendMessage(String messageContent) async{
    if(messageContent.trim().isEmpty){
      return ;
    }
    Message message = Message(
        content: messageContent,
        dateTime: DateTime.now().millisecondsSinceEpoch,
        categoryId: room.categoryId,
        roomId: room.id,
        senderId: currentUser?.id ?? '',
        senderName: currentUser?.userName ?? '');
    try{
      var result = await DataBaseUtils.insertMessageToRoom(message);
      navigator.clearMessageText();
    }catch(error){
      navigator.showMessage(error.toString());
    }
  }

  void UpdateRoomMessages(){
    streamMessage = DataBaseUtils.getMessages(room.id);
  }


}