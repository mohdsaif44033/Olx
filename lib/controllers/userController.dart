// User CRUD
// C - Create
// R - Read
// U - Update
// D - Delete

import 'package:cloud_firestore/cloud_firestore.dart';

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
}
