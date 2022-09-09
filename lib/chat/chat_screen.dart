import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/chat/chat_navigator.dart';
import 'package:flutter_app_chat_c6_alex/chat/chat_screen_view_model.dart';
import 'package:flutter_app_chat_c6_alex/chat/message_screen.dart';
import 'package:flutter_app_chat_c6_alex/model/message.dart';
import 'package:flutter_app_chat_c6_alex/model/room.dart';
import 'package:flutter_app_chat_c6_alex/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_chat_c6_alex/utils.dart' as Utils;


class ChatScreen extends StatefulWidget {
  static String routeName = 'chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> implements ChatNavigator {
  ChatScreenViewModel viewModel = ChatScreenViewModel();
  String messageContent = '';
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Room;
    var userProvider = Provider.of<UserProvider>(context);
    viewModel.room = args ;
    viewModel.currentUser = userProvider.user;
    viewModel.UpdateRoomMessages();

    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Stack(children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/background_main.png',
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
              title: Text(args.title),
            ),
            body: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade700,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 32),
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: StreamBuilder<QuerySnapshot<Message>>(
                    stream: viewModel.streamMessage,
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if(snapshot.hasError){
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                      var messages = snapshot.data?.docs.map((doc) => doc.data()).toList();
                      return  ListView.builder(itemBuilder: (context,index){
                        return MessageItem(message: messages!.elementAt(index));
                      },
                        itemCount:messages?.length ?? 0 ,
                      );
                    }),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          onChanged: (text){
                            messageContent = text ;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(4),
                            hintText: 'Type a message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(12)),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                                color: Colors.blue
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      ElevatedButton(
                          onPressed: () {
                            viewModel.sendMessage(messageContent);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text('Send'),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.send)
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ]));
  }

  @override
  void showMessage(String message) {
    Utils.showMessage(context, message, 'OK', (context){
      Navigator.pop(context);
    });
  }

  @override
  void clearMessageText() {
    controller.clear();
  }
}
