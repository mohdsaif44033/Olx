// User CRUD
// C - Create - Done
// R - Read - Going On
// U - Update
// D - Delete

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:olx/models/adModel.dart';
import 'package:olx/models/userModel.dart';

class UserController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> createUser({name, email, phone, uid}) async {
    var createdAt = DateTime.now();
    var userData = {
      "name": name,
      "email": email,
      "phone": phone,
      "time": createdAt,
      "totalAds": 0,
      "favourites": [],
      "uid": uid
    };

    CollectionReference users = firestore.collection('Users');
    print('users $users');
    try {
      await users.add(userData);
      return true;
    } catch (e) {
      return false;
    }
  }

  getUser({uid}) async {
    CollectionReference users = firestore.collection('Users');
    QuerySnapshot user = await users.where("uid", isEqualTo: uid).get();

    if (user.docs.isNotEmpty) {
      var userAsJson = user.docs.first;

      UserModel userModel = UserModel(
          email: userAsJson.get("email"),
          uid: userAsJson.get("uid"),
          createdAt: (userAsJson.get("time") as Timestamp).toDate(),
          favouriteAd: userAsJson.get("favourites"),
          name: userAsJson.get("name"),
          phone: userAsJson.get("phone"),
          totalAds: userAsJson.get("totalAds"));
      return userModel;
    }
    return null;
  }
}
