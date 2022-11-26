// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:olx/controllers/homeData.dart';
import 'package:olx/screens/accountPage.dart';
import 'package:olx/screens/chatPage.dart';
import 'package:olx/screens/viewProfile.dart';

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
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share))
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 5.0, bottom: 3.0, left: 5.0, right: 5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size.fromWidth(
                          MediaQuery.of(context).size.width * 0.45),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.cyan,
                      padding: const EdgeInsets.all(10.0),
                      textStyle: const TextStyle(fontSize: 22),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.chat),
                        const Text(
                          ' Chat',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size.fromWidth(
                          MediaQuery.of(context).size.width * 0.46),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.cyan,
                      padding: const EdgeInsets.all(10.0),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.currency_rupee_sharp),
                        const Text(' Make Offer',
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  // TextButton(style: ButtonStyle(,backgroundColor: MaterialStateProperty.all(Colors.amber)),onPressed: (){}, child: Row(children: [Icon(Icons.message_rounded),Text("Chat")],))
                ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  itemCount: homeData.HomeList.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      "${homeData.HomeList[index]["image"]}",
                      fit: BoxFit.cover,
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
                      height: MediaQuery.of(context).size.height * 0.14,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 2.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 6.0, right: 6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "₹ 2,300",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.thumb_up_alt_outlined))
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 6.0, right: 6.0),
                              child: Text(
                                "Mi 4gb ram 32 GB",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 3.40, right: 10.0, top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_on,
                                        size: 18.0,
                                      ),
                                      Text("TUGHLAKABAD, DELHI",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  const Text("TODAY")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 2.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ignore: prefer_const_constructors
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 6.0, right: 6.0, bottom: 15.0),
                              child: const Text(
                                "Details",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text("BRAND",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                  Padding(
                                    padding: EdgeInsets.only(left: 100.0),
                                    child: Text("Mi",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 2.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 6.0, right: 6.0, bottom: 15.0),
                              child: Text(
                                "Description",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 6.0, right: 6.0),
                              child: Text(
                                "Mi 4gb ram 32 GB",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          elevation: 2.5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                                  radius: 40.0,
                                ),
                                SizedBox(
                                  height: 200,
                                  width:
                                      MediaQuery.of(context).size.width - 110.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0,top: 3.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8.0,top: 2.0),
                                          child: Text(
                                            "SAIF",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.0,),
                                              child: Text(
                                                "Member Since 15:35",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 12.8,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            const Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                size: 14)
                                          ],
                                        ),
                                        // ignore: prefer_const_constructors
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.cyan,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewProfile()));
                                          },
                                          child: const Text('SEE PROFILE'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))),
                  SizedBox(
                      height: 301,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          elevation: 2.5,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    "Ad posted at ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Image.network(
                                      "https://i0.wp.com/www.cssscript.com/wp-content/uploads/2018/03/Simple-Location-Picker.png?fit=561%2C421&ssl=1",
                                      height: 250,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              )))),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          elevation: 2.5,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "AD ID : 1800151556",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(
                                          fontSize: 14, color: Colors.blue),
                                    ),
                                    onPressed: () {},
                                    child: const Text('REPORT THIS AD'),
                                  ),
                                ],
                              ))))
                ],
              )
            ],
          ),
        ));
  }
}
