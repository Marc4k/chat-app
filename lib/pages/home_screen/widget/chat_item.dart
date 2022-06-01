import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/pages/home_screen/widget/badged_widget.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:chat_app/shared/screen_adaption.dart';
import 'package:chat_app/shared/sized_box_height_widget.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(
      {Key? key,
      required this.imageLink,
      required this.name,
      required this.lastMessage,
      required this.date,
      required this.count})
      : super(key: key);
  final String imageLink;
  final String name;
  final String lastMessage;
  final String date;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24 * sH(context)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16), // Image border
            child: SizedBox.fromSize(
              size: Size(48 * sW(context), 48 * sH(context)), // Image radius
              child: Image.network(imageLink, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 16 * sW(context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(text: name, style: body1Style),
              SizedBoxHeightWidget(height: 5),
              CustomTextWidget(text: lastMessage, style: metadata1Style)
            ],
          ),
          Spacer(),
          Column(
            children: [
              CustomTextWidget(text: date, style: metadata2Style),
              SizedBoxHeightWidget(height: 3),
              BadgedWidget(count: count)
            ],
          )
        ],
      ),
    );
  }
}
