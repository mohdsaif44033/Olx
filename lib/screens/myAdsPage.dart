import 'package:flutter/material.dart';
import 'package:olx/screens/HomePage.dart';
import 'package:olx/screens/accountPage.dart';
import 'package:olx/screens/chatPage.dart';

class MyAdsPage extends StatefulWidget {
  @override
  MyAdsPageState createState() => MyAdsPageState();
}

class MyAdsPageState extends State<MyAdsPage>
    with SingleTickerProviderStateMixin {
  int bottomNavBarSelectedItem = 0;
  late TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.7,
        title: Text(
          "MY ADS",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 15.5),
              tabs: const [
                Tab(
                  text: "Ads",
                ),
                Tab(
                  text: "Favourites",
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.cyan,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Row(
                              children: [
                                Text(
                                  "View all (0)",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 320,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/0/00/Nothing_Logo.webp",
                              fit: BoxFit.fill,
                              height: 251,
                              width: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "You haven't liked anything yet",
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(height: 15),
                            Text(
                                "Mark the items that you like and share it with the world!")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                          },
                          child: Container(
                            height: 40,
                            width: 300,
                            alignment: Alignment.center,
                            child: Text("Discover",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      )
                    ],
                  )
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BottomNavBar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.blue,
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
                context, MaterialPageRoute(builder: (context) => const Home()));
          } else if (bottomNavBarSelectedItem == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatPage()));
          } else if (bottomNavBarSelectedItem == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
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
