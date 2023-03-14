import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olx/controllers/homeController.dart';
import 'package:olx/models/adModel.dart';
import 'package:olx/screens/HomePage.dart';

class CreateAd extends StatefulWidget {
  const CreateAd({super.key});

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController cat = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController location = TextEditingController();

  List<String> AdImages = [];

  // Controller
  var homeController = Get.put(HomeController());

  createAdOnFirestore() {
    AdModel adModel = AdModel(
        createdAt: DateTime.now(),
        createdBy: ["1"],
        desc: desc.text,
        title: title.text,
        details: details.text,
        image: AdImages,
        likes: 0,
        location: [location.text],
        price: int.parse(price.text));
    bool isAdded = homeController.createAd(adModel);

    if (isAdded) {
      Get.to(() => Home());
      Get.snackbar("Ad Created Succesfully!",
          "You will soon start getting messages from interested people");
    } else {
      Get.snackbar("Something is not right!", "Please try again later!");
    }
  }

  getAdImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();
    // Convert to base64
    for (var image in images!) {
      var file = File(image.path);
      String base64String = base64Encode(file.readAsBytesSync());
      AdImages.add(base64String);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Ad")),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Title"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Descrition"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Category"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Price"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Details/Brand"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Location"),
            ),
            Container(
              child: ElevatedButton(
                child: const Text("Select Product Images"),
                onPressed: () {
                  getAdImages();
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < AdImages.length; i++)
                    Image.memory(
                      base64Decode(AdImages[i]),
                      height: 100,
                      width: 100,
                    )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  createAdOnFirestore();
                },
                child: const Text("Create"))
          ],
        ),
      ),
    );
  }
}
