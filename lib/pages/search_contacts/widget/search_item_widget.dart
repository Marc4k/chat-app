import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget(
      {Key? key,
      required this.img,
      required this.username,
      required this.onAdd})
      : super(key: key);
  final String img;
  final String username;
  final VoidCallback onAdd;
  @override
  Widget build(BuildContext context) {
    bool isImage = false;
    if (img == "NoPictureNoPicture") {
      isImage = false;
    } else {
      isImage = true;
    }
    ;

    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 10.h),
      child: Row(
        children: [
          isImage
              ? CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(img),
                  radius: 15.r,
                )
              : ProfilePicture(
                  name: username,
                  radius: 15.r,
                  fontsize: 21.sp,
                  count: 2,
                ),
          SizedBox(width: 15.w),
          Text(username),
          Spacer(),
          IconButton(onPressed: onAdd, icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
