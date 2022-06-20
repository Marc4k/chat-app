import '../../sign_up_in_screen/view/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "More",
          style: TextStyle(
            color: ColorChance().getTextColor(),
          ),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => SignInScreen()),
                    (route) => false);
              },
              child: Text("Logout"))
        ],
      ),
    );
  }
}
