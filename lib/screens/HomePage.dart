import 'package:flutter/material.dart';
import 'package:olx/controllers/homeData.dart';
import 'package:olx/screens/adPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeData homeData = HomeData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on),
                  Text(
                    "Chirag Delhi",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
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
                    hintText: "dsa"),
              )
            ],
          ),
        ),
      ),
      body: Container(margin: EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0, top: 14, bottom: 14),
              child: Text(
                "Fresh Recommendations",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(itemCount: homeData.HomeList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RoundedImage(
                              src: homeData.HomeList[index]["image"],
                              text: homeData.HomeList[index]["text"]);
                    }
                    )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.71,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: homeData.HomeList.length,
                itemBuilder: (context, index) {
                  return HomeCard(context, homeData.HomeList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget HomeCard(context, home) {
  void openAd (context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AdPage(home: home)));
  }
  return GestureDetector(onTap: () {
    openAd(context);
  },
    child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        height: 220,
        width: MediaQuery.of(context).size.width*0.5,
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
                        "${home["image"]}",
                        fit: BoxFit.cover,
                        height: 138,
                        width: MediaQuery.of(context).size.width,
                      )),
                  Text(
                    "${home['text']}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${home["text"]}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "${home["text"]}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                      Text(
                        "${home["text"]}",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
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

Widget RoundedImage({src, text}) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: 120,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.network(
                "$src",
                height: 50,
                width: 120,
                fit: BoxFit.cover,
              ).image),
              borderRadius: BorderRadius.all(Radius.circular(28))),
          child: Container(
              height: 77.5,
              width: 116.2,
              alignment: Alignment.center,
              color: Color.fromARGB(55, 8, 8, 8),
              child: Text(
                "$text",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ),
      ));
}