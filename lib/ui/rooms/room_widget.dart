import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/chat/chat_screen.dart';
import 'package:flutter_app_chat_c6_alex/model/room.dart';

class RoomWidget extends StatelessWidget {
  Room room;
  RoomWidget({required this.room});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ChatScreen.routeName,arguments: room);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ), // changes position of shadow
            ]),
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${room.categoryId}.png',
              width: 80,
            ),
            SizedBox(height: 15,),
            Text(room.title)
          ],
        ),
      ),
    );
  }
}
