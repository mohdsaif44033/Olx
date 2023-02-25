import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olx/controllers/homeController.dart';
import 'package:olx/models/adModel.dart';
import 'package:olx/screens/adPage.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  int bottomNavBarSelectedItem = 0;
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(95),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.location_on),
                   GestureDetector(onTap: () {
                    homeController.getAd();
                   },
                     child: Text(
                      "Chirag Delhi",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                                     ),
                   ),
                ],
              ),
              const SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(12)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0),
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Find Cars, Mobile Phones and more"),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 13.0, top: 5, bottom: 14),
              child: Text(
                "Fresh Recommendations",
                style: TextStyle(fontSize: 20),
              ),
            ),
        Obx(()=>    SizedBox(
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount:homeController.adArray.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(()=> RoundedImage(
                          src: homeController.adArray[index].image,
                          text: homeController.adArray[index].title));
                    }))),
                    SizedBox(height: 1),
       Obx(()=>     SizedBox(
              height: MediaQuery.of(context).size.height * 0.58,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                   childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height*0.60),
        
                    
                    ),
                shrinkWrap: true,
                itemCount: homeController.adArray.length,
                itemBuilder: (context, index) {
                  return HomeCard(context, homeController.adArray[index]);
                },
              ),
            )
            ),
          ],
        ),
      ),
    );
  }
  Widget BottomNavBar() {
  return BottomNavigationBar(
      selectedItemColor: Colors.cyan,
      unselectedItemColor: Colors.black,
      unselectedLabelStyle: const TextStyle(color: Colors.black),
      showUnselectedLabels: true,
      currentIndex: bottomNavBarSelectedItem,
      onTap: (value) {
        // setState(() {
        //   bottomNavBarSelectedItem = value;
        // });
        // if (bottomNavBarSelectedItem == 0) {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => const Home()));
        // } else if (bottomNavBarSelectedItem == 1) {
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => const ChatPage()));
        // } else if (bottomNavBarSelectedItem == 2) {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => const Home()));
        // } else if (bottomNavBarSelectedItem == 3) {
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => MyAdsPage()));
        // } else if (bottomNavBarSelectedItem == 4) {
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => const AccountPage()));
        // }
      },
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home"),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: "Chat"),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: "Sell"),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.bug_report_rounded,
            ),
            label: "My Ads"),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_sharp,
            ),
            label: "Profile"),
      ]);
}





// ignore: non_constant_identifier_names
Widget HomeCard(context,AdModel home) {
  void openAd(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AdPage(home: home)));
  }

  return GestureDetector(
    onTap: () {
      openAd(context);
    },
    child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        height: 100,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(
                        "${home.image}",
                        fit: BoxFit.cover,
                        height: 125,
                        width: MediaQuery.of(context).size.width,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left:4.7),
                    child: Text(
                      "${home.title}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:4.7),
                    child: Text(
                      "${home.title}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:4.7),
                    child: Text(
                      "${home.title}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,size: 18.0,
                        color: Colors.grey,
                      ),
                      Text(
                        "${home.title}",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 11.5),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
  );
}

// ignore: non_constant_identifier_names
Widget RoundedImage({src, text}) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right:5),
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: 120,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.network(
                "$src",
                height: 50,
                width: 40,
                fit: BoxFit.cover,
              ).image),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Container(
              height: 78.5,
              width: 116,
              alignment: Alignment.center,
              color: const Color.fromARGB(55, 8, 8, 8),
              child: Text(
                "$text",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ),
      ));
}
}