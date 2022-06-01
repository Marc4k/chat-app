import 'package:chat_app/pages/home_screen/widget/chat_item.dart';
import 'package:chat_app/pages/home_screen/widget/chat_story_add_item.dart';
import 'package:chat_app/pages/home_screen/widget/chat_story_item.dart';
import 'package:chat_app/pages/home_screen/widget/search_bar.dart';
import 'package:chat_app/shared/screen_adaption.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../shared/sized_box_height_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Chats",
          style: TextStyle(
            color: ColorChance().getTextColor(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.maps_ugc_outlined),
            color: ColorChance().getTextColor(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              height: 70 * sH(context),
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ChatStoryAddItem();
                  }

                  return ChatStoryItem(
                      name: "Marcasdasdsa  sa s as as sa a ",
                      imageLink:
                          "https://images.unsplash.com/photo-1653923299908-359762486cd4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80");
                },
              ),
            ),
            SizedBoxHeightWidget(height: 16),
            Divider(),
            SizedBoxHeightWidget(height: 16),
            SearchBar(),
            SizedBoxHeightWidget(height: 20),
            Flexible(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ChatItem(
                    imageLink:
                        "https://images.unsplash.com/photo-1473773508845-188df298d2d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
                    name: "Marc",
                    lastMessage: "Zewass",
                    date: "Today",
                    count: 2,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
