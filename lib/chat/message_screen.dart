import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/model/message.dart';
import 'package:flutter_app_chat_c6_alex/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MessageItem extends StatelessWidget {
  Message message;
  late UserProvider userProvider ;
  MessageItem({required this.message});
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    print('UserId: ${userProvider.user!.id }');
    print('senderId: ${message.senderId}');
    return userProvider.user!.id == message.senderId ?
    SentMessage(message: message): RecieveMessage(message: message);
  }
}

class SentMessage extends StatelessWidget {
  Message message;
  SentMessage({required this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(12) ,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  topLeft: Radius.circular(12)),
            ),
            child: Text(
              message.content,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(message.dateTime.toString())
        ],
      ),
    );
  }
}

class RecieveMessage extends StatelessWidget {
  Message message;
  RecieveMessage({required this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12) ,
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(12)),
            ),
            child: Text(
              message.content,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(message.dateTime.toString()),

        ],
      ),
    );
  }
}

