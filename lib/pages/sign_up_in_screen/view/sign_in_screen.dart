import 'package:chat_app/domain/user_auth/user_auth_impl.dart';
import 'package:chat_app/pages/home_screen/view/home_screen.dart';
import 'package:chat_app/pages/sign_up_in_screen/view/sign_up_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../shared/button_widget.dart';
import '../../../shared/custom_input_field.dart';
import '../../../shared/custom_text_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
bool isLoading = false;
bool isObscure = true;
String error = "";

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorChance().getBackgroundColor(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: ColorChance().getTextColor(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextWidget(text: "Sign in!", style: heading2Style),
                SizedBox(height: 48.h),
                CustomEmailFieldWidget(
                    hintText: "Enter your E-Mail", controller: email),
                SizedBox(height: 20.h),
                CustomPasswordFieldWidget(
                    isObscure: isObscure,
                    onEyeTap: () {
                      setState(() => isObscure = !isObscure);
                    },
                    hintText: "Enter your Password",
                    controller: password),
                SizedBox(height: 10.h),
                CustomTextWidget(text: error, style: errorStyle),
                SizedBox(height: 50.h),
                ButtonWidget(
                    isLoading: isLoading,
                    callback: () async {
                      if (password.text.length > 6 &&
                          EmailValidator.validate(email.text) == true) {
                        setState(() => isLoading = true);
                        dynamic userData = await UserAuthImpl()
                            .signInUser(email.text, password.text);
                        email.clear();
                        password.clear();
                        userData.fold((userData) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return HomeScreen();
                          }));

                          isLoading = false;
                        }, (failure) {
                          setState(() {
                            error = failure.errorMessage;
                            isLoading = false;
                          });
                        });
                      }
                    },
                    text: "Continue"),
                SizedBox(height: 5.h),
                GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => SignUpScreen()),
                          (route) => false);
                    },
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "You don't have a account?",
                            style: metadata2Style),
                        TextSpan(text: " SignUp", style: metadata1Style),
                      ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(providers: [
                                BlocProvider<GetBabyDataCubit>(
                                    create: (BuildContext context) =>
                                        GetBabyDataCubit()..getBabyData())
                              ], child: HomeScreen())));
*/