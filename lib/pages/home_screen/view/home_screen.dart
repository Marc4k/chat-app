import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../pages/chat_page.dart';
import '../pages/contact_screen.dart';
import '../pages/more_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int indexNavigation = 1;

class _HomeScreenState extends State<HomeScreen> {
  final screens = [
    ContactPage(),
    ChatPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: CustomColors.textColorLightMode,
        unselectedItemColor: CustomColors.textColorLightMode,
        elevation: 2,
        showUnselectedLabels: false,
        currentIndex: indexNavigation,
        onTap: (index) {
          setState(() {
            indexNavigation = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Contacs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More")
        ],
      ),
      body: IndexedStack(
        index: indexNavigation,
        children: screens,
      ),
    );
  }
}
