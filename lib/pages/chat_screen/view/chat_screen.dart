import 'package:chat_app/pages/chat_screen/widget/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../constants/colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.chatBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: ColorChance().getTextColor(),
        ),
        title: Text(
          "Contacts",
          style: TextStyle(
            color: ColorChance().getTextColor(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: Icon(
              Icons.search,
            ),
            color: ColorChance().getTextColor(),
          ),
          IconButton(
            onPressed: () async {},
            icon: Icon(
              Icons.menu,
            ),
            color: ColorChance().getTextColor(),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: chatBubbleCustom(
                      false, "K, I'm on my way", false, DateTime.now()),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                Expanded(child: TextFormField()),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: CustomColors.chatSender,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
