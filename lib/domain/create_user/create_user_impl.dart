import 'dart:io';

import 'package:chat_app/domain/create_user/create_user_repository.dart';
import 'package:chat_app/error/failures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CreateUserImpl extends CreateUserRepository {
  @override
  Future<Either<String, Failure>> createUser(
      String userName, File? image) async {
    try {
      bool isSame = await checkUserName(userName);

      if (isSame == true) {
        return right(UserAuthFailure(errorMessage: "username already in use"));
      }

      final CollectionReference userData =
          FirebaseFirestore.instance.collection('UserData/');

      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final uid = user!.uid;
      String pictureUrl = "";
      if (image != null) {
        final path = "profilPicture/$uid/profil.png";
        final ref = FirebaseStorage.instance.ref().child(path);
        await ref.putFile(image);

        final result = await ref.list(ListOptions(maxResults: 1));

        pictureUrl = await ref.getDownloadURL();
      } else {
        pictureUrl = "NoPictureNoPicture";
      }

      await userData.doc(uid).set({
        "userName": userName,
        "imgPath": pictureUrl,
      });

      return left("");
    } catch (e) {
      return right(UserAuthFailure(errorMessage: "desss: " + e.toString()));
    }
  }
}

Future<bool> checkUserName(String userName) async {
  bool isSame = false;

  final CollectionReference userData =
      FirebaseFirestore.instance.collection('UserData/');

  await userData.get().then((snapshot) {
    snapshot.docs.forEach((element) {
      //Object? data = element.data();
      Map<String, dynamic> data = element.data()! as Map<String, dynamic>;

      if (data["userName"] == userName) {
        isSame = true;
      }
    });
  });

  return isSame;
}
