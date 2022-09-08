import 'package:flutter/material.dart';
import 'package:flutter_app_chat_c6_alex/ui/home/home_navigator.dart';
import 'package:flutter_app_chat_c6_alex/ui/home/home_screen_view_model.dart';
import 'package:flutter_app_chat_c6_alex/ui/rooms/add_room.dart';
import 'package:flutter_app_chat_c6_alex/ui/rooms/room_widget.dart';
import 'package:provider/provider.dart';

class HomeScreeen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> implements HomeNavigator {
  HomeScreenViewModel viewModel = HomeScreenViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    viewModel.getRooms();
  }

  @override
  Widget build(BuildContext context) {
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
              title: Text('Home Screen'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddRoom.routeName);
              },
              child: Icon(Icons.add),
            ),
            body: Consumer<HomeScreenViewModel>(
              builder: (buildContext, HomeScreenViewModel, child) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16),
                          itemBuilder: (context, index) {
                            return RoomWidget(
                              room: viewModel.rooms[index],
                            );
                          },
                          itemCount: viewModel.rooms.length,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
      ]),
    );
  }
}
