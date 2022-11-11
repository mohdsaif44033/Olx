import 'package:flutter/material.dart';
import 'package:olx/controllers/homeData.dart';
import 'package:olx/screens/HomePage.dart';

class AdPage extends StatefulWidget {
  const AdPage({super.key, required this.home});

  final home;

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  HomeData homeData = HomeData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: homeData.HomeList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Image.network(
                      "${homeData.HomeList[index]["image"]}",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " ₹ 2300",
                                style: TextStyle(fontSize: 23),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.thumb_up_alt_outlined))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              "Mi 4gb ram 32 GB",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0, top: 4.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 18.0,
                                ),
                                Text("TUGHLAKABAD, DELHI"),
                                SizedBox(width: 275),
                                Text("TODAY")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 3.0),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Details",
                              style: TextStyle(fontSize: 23),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(
                                "Mi 4gb ram 32 GB",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0, top: 4.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 18.0,
                                  ),
                                  Text("TUGHLAKABAD, DELHI"),
                                  SizedBox(width: 275),
                                  Text("TODAY")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
