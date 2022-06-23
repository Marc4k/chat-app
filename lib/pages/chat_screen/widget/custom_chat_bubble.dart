import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/styles.dart';
import 'package:chat_app/shared/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

Widget chatBubbleCustom(
  bool isRead,
  String message,
  bool isSender,
  DateTime sendTime,
) {
  if (isSender == true) {
    return Row(
      children: [
        Expanded(
          child: ChatBubble(
              elevation: 0,
              clipper: ChatBubbleClipper5(
                type: isSender
                    ? BubbleType.sendBubble
                    : BubbleType.receiverBubble,
              ),
              backGroundColor: CustomColors.chatSender,
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextWidget(text: message, style: chatStyleSender),
                  SizedBox(height: 10.h),
                  isRead
                      ? Text(
                          "${formateDateToTimeOnly(sendTime)} · Read",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )
                      : Text(
                          "${formateDateToTimeOnly(sendTime)} · Send",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                  SizedBox(height: 4.h),
                ],
              )),
        ),
        SizedBox(width: 16.w),
      ],
    );
  } else {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 16.w),
        Expanded(
          child: ChatBubble(
              elevation: 0,
              clipper: ChatBubbleClipper5(
                type: isSender
                    ? BubbleType.sendBubble
                    : BubbleType.receiverBubble,
              ),
              backGroundColor: CustomColors.chatNotSender,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                          text: message, style: chatStyleNotSender),
                      SizedBox(height: 10.h),
                    ],
                  ),
                  isRead
                      ? Text(
                          "${formateDateToTimeOnly(sendTime)} · Read",
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        )
                      : Text(
                          "${formateDateToTimeOnly(sendTime)} · Send",
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                  SizedBox(height: 4.h),

                  //  Text(message[index].name)
                ],
              )),
        ),
      ],
    );
  }
}

String formateDateToTimeOnly(DateTime time) {
  //  DateTime date =
  //     DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);

  String formattedDate = DateFormat('kk:mm').format(time);
  return formattedDate;
}
