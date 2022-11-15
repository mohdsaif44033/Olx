
import 'package:flutter/material.dart';
import 'package:olx/screens/adPage.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                  onPressed: () {Navigator.pop(context);},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
        backgroundColor: Colors.white10,
        elevation: 0.0,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: const SizedBox(
                    width: 280,
                    child: Text(
                      "   Mohd Saif",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    )),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.flag,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.health_and_safety_outlined,
                    color: Colors.black,
                  )),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: const TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              prefixIcon: Icon(Icons.attachment_rounded,color: Colors.black,),
              suffixIcon: Icon(Icons.mic_outlined,color: Colors.black,)
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AdPage(home: (""))));
        },
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 1.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Mi 4gb ram 32 GB",
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    "₹ 2,300",
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
