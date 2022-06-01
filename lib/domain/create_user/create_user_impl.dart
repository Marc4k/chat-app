import 'package:chat_app/domain/create_user/create_user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserImpl extends CreateUserRepository {
  @override
  Future<void> createUser(UserCredential user, String firstName,
      String lastname, String imgPath) async {
    final CollectionReference userData =
        FirebaseFirestore.instance.collection('UserData/');
    String userID = "";
    await userData.doc(user.user!.uid).set({
      "firstName": firstName,
      "lastname": lastname,
      "imgPath": imgPath,
    });
  }
}
