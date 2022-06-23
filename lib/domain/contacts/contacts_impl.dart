import 'package:chat_app/domain/contacts/models/contact_model.dart';
import 'package:chat_app/domain/contacts/models/contact_screen_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import 'contacts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../error/failures.dart';

class ContactsImpl extends Contacts {
  @override
  Future<List<ContactModel>> searchInContacts(String serachTerm) async {
    List<ContactModel> items = [];
    List contactsAlreadyAdded = [];
    List<int> indexToRemove = [];
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
        List contact = [];

        if (data["contacts"] != null) {
          contactsAlreadyAdded = data["contacts"];
        }
      });
    });

    await FirebaseFirestore.instance
        .collection("UserData")
        .where("caseSearch", arrayContains: serachTerm.toLowerCase())
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;

        if (data["uID"] != uid) {
          items.add(ContactModel(
              username: data["userName"],
              pictureUrl: data["imgPath"],
              userId: element.id));
        }
      });
    });

    for (var i = 0; i < items.length; i++) {
      for (var g = 0; g < contactsAlreadyAdded.length; g++) {
        if (items[i].userId == contactsAlreadyAdded[g]) {
          indexToRemove.add(i);
        }
      }
    }
    for (var h = 0; h < indexToRemove.length; h++) {
      items.removeAt(indexToRemove[h]);
    }

    contactsAlreadyAdded.clear();
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
    String lastseen = "";
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

    //get last seen

    await FirebaseFirestore.instance
        .collection("UserData")
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) async {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;

        for (var i = 0; i < contactsId.length; i++) {
          if (data["uID"] == contactsId[i]) {
            if (data["online"] == true) {
              lastseen = "Online";
            } else {
              lastseen =
                  calculateLastSeen((data["lastOnline"] as Timestamp).toDate());
            }

            contacts.add(ContactScreenModel(
                username: data["userName"],
                pictureUrl: data["imgPath"],
                userId: data["uID"],
                lastSeen: lastseen));
          }
        }
      });
    });
//await getLastSeen(data["uID"])
    return contacts;
  }
}

Future<String> getLastSeen(String id) async {
  String lastseen = "";

  await FirebaseFirestore.instance
      .collection("userOnlineStatus")
      .where("uID", isEqualTo: id)
      .get()
      .then((snapshot) {
    snapshot.docs.forEach((element) async {
      Map<String, dynamic> onlineData = element.data() as Map<String, dynamic>;

      if (onlineData["online"] == true) {
        lastseen = "Online";
      } else {
        lastseen =
            calculateLastSeen((onlineData["lastOnline"] as Timestamp).toDate());
      }
    });
  });

  return lastseen;
}

String calculateLastSeen(DateTime lastOnline) {
  DateTime now = DateTime.now();

  final differenceInMinutes = now.difference(lastOnline).inMinutes;
  final differenceInHours = now.difference(lastOnline).inHours;
  final differenceInDays = now.difference(lastOnline).inDays;
  if (differenceInMinutes <= 59) {
    return "Last seen $differenceInMinutes minutes ago";
  } else if (differenceInHours <= 23) {
    return "Last seen $differenceInHours hours ago";
  } else if (differenceInDays >= 1 && differenceInDays <= 2) {
    return "Last seen yesterday";
  } else {
    return "Last seen on ${DateFormat("dd-MM-yyyy").format(lastOnline)}";
  }
}
