import 'package:chat_app/domain/contacts/models/contact_model.dart';
import 'package:chat_app/domain/contacts/models/contact_screen_models.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'contacts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../error/failures.dart';

class ContactsImpl extends Contacts {
  @override
  Future<List<ContactModel>> searchInContacts(String serachTerm) async {
    List<ContactModel> items = [];

    await FirebaseFirestore.instance
        .collection("UserData")
        .where("caseSearch", arrayContains: serachTerm.toLowerCase())
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;

        items.add(ContactModel(
            username: data["userName"],
            pictureUrl: data["imgPath"],
            userId: element.id));
      });
    });

    return items;
  }

  @override
  Future<Either<String, Failure>> addContact(String userIdOfAddedUser) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final uid = user!.uid;

      final CollectionReference userData =
          FirebaseFirestore.instance.collection('UserData/');

      await FirebaseFirestore.instance
          .collection("UserData")
          .where("uID", isEqualTo: uid)
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((element) async {
          Map<String, dynamic> data = element.data() as Map<String, dynamic>;
          List contact = [];

          if (data["contacts"] != null) {
            contact = data["contacts"];
          }

          contact.add(userIdOfAddedUser);

          await userData.doc(uid).set({
            "userName": data["userName"],
            "imgPath": data["imgPath"],
            "uID": uid,
            "caseSearch": data["caseSearch"],
            "contacts": contact
          });
        });
      });

      return left("");
    } catch (e) {
      return right(ContactsFailure(errorMessage: "error"));
    }
  }

  @override
  Future<List<ContactScreenModel>> getAllContacts() async {
    List<ContactScreenModel> contacts = [];

    List contactsId = [];

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    await FirebaseFirestore.instance
        .collection("UserData")
        .where("uID", isEqualTo: uid)
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) async {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;
        if (data["contacts"] != null) {
          contactsId = data["contacts"];
        }
      });
    });

    await FirebaseFirestore.instance
        .collection("UserData")
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) async {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;

        for (var i = 0; i < contactsId.length; i++) {
          if (data["uID"] == contactsId[i]) {
            contacts.add(ContactScreenModel(
                username: data["userName"],
                pictureUrl: data["imgPath"],
                userId: data["uID"],
                lastSeen: "c"));
          }
        }
      });
    });

    return contacts;
  }
}
