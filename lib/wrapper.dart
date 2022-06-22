import 'package:chat_app/cubits/get_contacts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home_screen/view/home_screen.dart';
import 'pages/sign_up_in_screen/view/sign_in_screen.dart';
import 'pages/sign_up_in_screen/view/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;

    if (user != null) {
      return MultiBlocProvider(providers: [
        BlocProvider<GetContactCubit>(
            create: (BuildContext context) =>
                GetContactCubit()..getAllContacts()),

        //GetEasySelectDataCubit
      ], child: HomeScreen());
    } else {
      return SignInScreen();
    }
  }
}
