import 'package:chat_app/pages/home_screen/view/home_screen.dart';
import 'package:chat_app/pages/sign_up_screen/view/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;

    if (user != null) {
      return HomeScreen();
    } else {
      return SignUpScreen();
    }
  }
}

/*
      return MultiBlocProvider(providers: [
        BlocProvider<GetBabyDataCubit>(
            create: (BuildContext context) =>
                GetBabyDataCubit()..getBabyData()),

        //GetEasySelectDataCubit
      ], child: HomeScreen());*/