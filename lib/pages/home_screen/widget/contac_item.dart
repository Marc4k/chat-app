import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/styles.dart';
import '../../../domain/contacts/models/contact_screen_models.dart';
import '../../../shared/custom_text_widget.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ContactScreenModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16), // Image border
            child: SizedBox.fromSize(
              size: Size(48.w, 48.h), // Image radius
              child: Image.network(data.pictureUrl, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(text: data.username, style: body1Style),
              SizedBox(height: 5.h),
              CustomTextWidget(text: data.lastSeen, style: metadata1Style)
            ],
          ),
        ],
      ),
    );
  }
}
