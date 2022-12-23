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

  createUser({name, email, phone, uid}) async {
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

    try {
      await users.add(userData);
      return true;
    } catch (e) {
      print(e);
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
          createdAt:
              DateTime.fromMicrosecondsSinceEpoch(userAsJson.get("time")),
          favouriteAd: userAsJson.get("favourites"),
          name: userAsJson.get("name"),
          phone: userAsJson.get("phone"),
          totalAds: userAsJson.get("totalAds"));
      return userModel;
    }
    return null;
  }

  getAd() async {
    CollectionReference ad = firestore.collection('Advertisement');
    QuerySnapshot advertisement = await ad.get();
    var advertisementJsonArray = advertisement.docs;
     var advertisementArray = [];
     var i=0;
    if (advertisementJsonArray.isNotEmpty) {
     
      for (i=0; i<advertisementJsonArray.length; i++){
      

      AdModel adModel = AdModel(
        createdAt: DateTime.fromMicrosecondsSinceEpoch(advertisementJsonArray[i].get("time")),
        createdBy: advertisementJsonArray[i].get('createdBy'),
        desc: advertisementJsonArray[i].get('desc'),
        details: advertisementJsonArray[i].get('details'),
        image: advertisementJsonArray[i].get('image'),
        likes: advertisementJsonArray[i].get('likes'),
        location: advertisementJsonArray[i].get('location'),
        price: advertisementJsonArray[i].get('price'),
        title: advertisementJsonArray[i].get('title'),
      );
      advertisementArray.add(adModel);
      }
      print("advertisementArray: $advertisementArray");
      return advertisementArray;

  }
  return null;
}
}