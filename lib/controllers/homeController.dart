import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:olx/models/adModel.dart';
import 'package:olx/models/userModel.dart';

class HomeController extends GetxController {
  RxList<AdModel> adArray = <AdModel>[].obs;
  @override
  void onInit() {
    getAd();
    super.onInit();
  }

   Rx<UserModel> user = UserModel().obs;

  getAd() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference ad = firestore.collection('Advertisement');
    QuerySnapshot advertisement = await ad.get();
    var advertisementJsonArray = advertisement.docs;
    var i = 0;
    adArray.clear();
    if (advertisementJsonArray.isNotEmpty) {
      for (i = 0; i < advertisementJsonArray.length; i++) {
        AdModel adModel = AdModel(
          // createdAt: (advertisementJsonArray[i].get("time") as Timestamp).toDate(),
          // createdBy: advertisementJsonArray[i].get('createdBy')??'',
          desc: advertisementJsonArray[i].get('desc') ?? '',
          details: advertisementJsonArray[i].get('details') ?? '',
          image: advertisementJsonArray[i].get('image') ?? '',
          likes: advertisementJsonArray[i].get('likes') ?? '',
          //location: advertisementJsonArray[i].get('location')??'',
          price: advertisementJsonArray[i].get('price') ?? '',
          title: advertisementJsonArray[i].get('title') ?? '',
        );
        adArray.add(adModel);
      }
      print('addArray ${adArray[0].image}');
    }
    return null;
  }
}
