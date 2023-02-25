import 'package:flutter/material.dart';
import 'package:olx/screens/HomePage.dart';
import 'package:olx/screens/chatPage.dart';
import 'package:olx/screens/myAdsPage.dart';
import 'package:olx/screens/viewProfile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int bottomNavBarSelectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
                  onPressed: () {Navigator.pop(context);},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
          elevation: 0.5,
          centerTitle: true,
          title: Text(
            "My Account",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white),
          bottomNavigationBar: BottomNavBar(),
          body: Column(
            children: [
              Container(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 12.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                                        "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                                    radius: 60.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 12),
                        child: Column( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                          Text(" Mohd Saif",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                            fontSize: 15, color: Colors.cyan,fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfile()));
                                      },
                                      child: const Text('View and Edit Profile'),
                                    ),
                          ),
                        ],),
                      )
                      ],
                  ),
                ),
              ),
              SizedBox(
            height: 100,
            child: Card(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                        Icons.supervisor_account_outlined,
                        size: 35,
                      ),
                      Container(height: 100,
                      width: MediaQuery.of(context).size.width - 85,
                        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "My Network",
                      overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Followers, following and find friends", overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                            )),
                          ],
                        ),
                      )
                ],
               ),
             ),
            ),
          ),SizedBox(
            height: 100,
            child: Card(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                        Icons.payment,
                        size: 35,
                      ),
                      Container(height: 100,
                      width: MediaQuery.of(context).size.width - 85,
                        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Buy Packages & My Orders", overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Packages, orders, invoices \n& billing information", overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                            )),
                          ],
                        ),
                      )
                ],
               ),
             ),
            ),
          ),SizedBox(
            height: 100,
            child: Card(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                        Icons.settings,
                        size: 35,
                      ),
                      Container(height: 100,
                      width: MediaQuery.of(context).size.width - 85,
                        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Settings", overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Privacy and logout", overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                            )),
                          ],
                        ),
                      )
                ],
               ),
             ),
            ),
          ),SizedBox(
            height: 100,
            child: Card(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                        Icons.help,
                        size: 35,
                      ),
                      Container(height: 100,
                      width: MediaQuery.of(context).size.width - 85,
                        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Help and Support", overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Help center, Terms and conditions,\nPrivacy policy", overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                            )),
                          ],
                        ),
                      )
                ],
               ),
             ),
            ),
          ),
            ],
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
        setState(() {
          bottomNavBarSelectedItem = value;
        });
        if (bottomNavBarSelectedItem == 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  Home()));
        } else if (bottomNavBarSelectedItem == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChatPage()));
        } else if (bottomNavBarSelectedItem == 2) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  Home()));
        } else if (bottomNavBarSelectedItem == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyAdsPage()));
        } else if (bottomNavBarSelectedItem == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AccountPage()));
        }
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
}
