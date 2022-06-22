import 'dart:async';

import 'package:chat_app/cubits/get_contacts_cubit.dart';
import 'package:chat_app/domain/last_seen/offline_online_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final screens = [
    ContactPage(),
    ChatPage(),
    MorePage(),
  ];

  @override
  void initState() {
    context.read<GetContactCubit>().getAllContacts();
    WidgetsBinding.instance.addObserver(this);
    OfflineOnlineImpl().setOnline();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        OfflineOnlineImpl().setOnline();
        break;
      case AppLifecycleState.inactive:
        OfflineOnlineImpl().setOffline();
        break;
      case AppLifecycleState.paused:
        OfflineOnlineImpl().setOffline();
        break;
      case AppLifecycleState.detached:
        OfflineOnlineImpl().setOffline();
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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
