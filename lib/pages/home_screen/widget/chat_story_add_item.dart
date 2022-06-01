import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../shared/screen_adaption.dart';
import '../../../shared/sized_box_height_widget.dart';

class ChatStoryAddItem extends StatelessWidget {
  const ChatStoryAddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16 * sW(context)),
      child: SizedBox(
        width: 55 * sW(context),
        child: Column(
          children: [
            Container(
                height: 50 * sH(context),
                width: 50 * sW(context),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFADB5BD), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Icon(
                  Icons.add,
                  color: Color(0xFFADB5BD),
                )),
            SizedBoxHeightWidget(height: 5),
            Text(
              overflow: TextOverflow.ellipsis,
              "Your Story",
              maxLines: 1,
              style: TextStyle(
                fontFamily: metadata2Style.fontFamily,
                fontSize: metadata2Style.fontSize,
                fontWeight: metadata2Style.fontWeight,
                color: Color(0xFF0F1828),
              ),
            )
          ],
        ),
      ),
    );
  }
}
