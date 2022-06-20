import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../shared/screen_adaption.dart';
import '../../../shared/sized_box_height_widget.dart';

class ChatStoryItem extends StatelessWidget {
  const ChatStoryItem({Key? key, required this.imageLink, required this.name})
      : super(key: key);
  final String imageLink;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16 * sW(context)),
      child: SizedBox(
        width: 55 * sW(context),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius:
                      BorderRadius.all(Radius.circular(16 * sW(context)))),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(14 * sW(context)), // Image border
                child: SizedBox.fromSize(
                  size:
                      Size(48 * sW(context), 48 * sH(context)), // Image radius
                  child: Image.network(imageLink, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBoxHeightWidget(height: 3),
            Text(
              overflow: TextOverflow.ellipsis,
              name,
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
