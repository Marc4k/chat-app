import 'package:chat_app/domain/last_seen/offline_online.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OfflineOnlineImpl extends OfflineOnline {
  @override
  Future<void> setOffline() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    var collection = FirebaseFirestore.instance.collection('UserData');
    collection.doc(uid).update({
      'lastOnline': DateTime.now(),
      "online": false,
    });
  }

  @override
  Future<void> setOnline() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    var collection = FirebaseFirestore.instance.collection('UserData');
    collection.doc(uid).update({
      'lastOnline': DateTime.now(),
      "online": true,
    });
  }
}
