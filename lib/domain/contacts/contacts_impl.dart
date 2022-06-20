import 'package:chat_app/domain/contacts/models/contact_model.dart';

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
}
