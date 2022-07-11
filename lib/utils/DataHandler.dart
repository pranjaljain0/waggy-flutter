import 'dart:convert';
import 'package:nanoid/nanoid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DataHandler {
  static signUpDataInsertion({required uid, required data}) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    users
        .doc(uid)
        .set(data)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static getUsersPet({required uid}) async {
    var data;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    await users.doc(uid).get().then((value) => data = value.data() as Map);

    return data['pets'];
  }

  static newPetDataInsertion({required data, required uid}) {
    var id = nanoid();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    users
        .doc(uid)
        .set({
          'pets': {
            id: {'id': id, ...data}
          }
        }, SetOptions(merge: true))
        .then((value) => print("Pet Added"))
        .catchError((error) => print("Failed to add Pet: $error"));
  }

  static updateUserLocation({required geoData, required uid}) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    users
        .doc(uid)
        .set({'location': geoData}, SetOptions(merge: true))
        .then((value) => print("Location Added"))
        .catchError((error) => print("Failed to add Location: $error"));
  }
}
