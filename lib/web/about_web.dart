import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  tealContainer(String text) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.tealAccent,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double widthDevice=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          size: 35.0,
          color: Colors.black,
        ),
        title: const Row(
          children: [
            Spacer(
              flex: 3,
            ),
            WebTabs(text: "Home", route: '/'),
            Spacer(),
            WebTabs(text: "Works", route: '/works'),
            Spacer(),
            WebTabs(text: "Blog", route: '/blog'),
            Spacer(),
            WebTabs(text: "About", route: '/about'),
            Spacer(),
            WebTabs(text: "Contact", route: '/contact'),
            Spacer(),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.tealAccent,
              radius: 72.0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70.0,
                backgroundImage: AssetImage("myself.jpg"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedText(text: "Maxwell Ndungu", size: 20),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async => await launchUrlString(
                      "https://www.instagram.com/_m.a.k.s.y_/"),
                  icon: SvgPicture.asset(
                    "instagram.svg",
                    width: 35,
                  ),
                ),
                IconButton(
                  onPressed: () async =>
                      {await launchUrlString("https://x.com/maksyn440")},
                  icon: SvgPicture.asset(
                    "twitterx.svg",
                    width: 35.0,
                  ),
                ),
                IconButton(
                    onPressed: () async =>
                        await launchUrlString("https://github.com/Maxwell-016"),
                    icon: SvgPicture.asset("github.svg"))
              ],
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/myself.jpg"),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "About Me",
                    style: TextStyle(fontSize: 40.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection("details").doc('tdUfdodi8b6sKHSOqmWO').snapshots(),
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Text("Error: ${snapshot.error}");
                              }
                              if(snapshot.hasData){
                                String data= snapshot.data!['about'];
                                return SizedBox(
                                  width: 400.0,
                                  child:SizedText(text: data, size: 15.0),);
                              }
                              else{
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Wrap(
                          spacing: 7.0,
                          children: [
                            tealContainer("Flutter"),
                            tealContainer("Firebase"),
                            tealContainer("Android"),
                            tealContainer("Windows"),
                          ],
                        ),
                        const SizedBox(
                          height: 60.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedText(
                      text: "Web Development",
                      size: 25.0,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: widthDevice/2.0,
                      child: const SizedText(
                          text:
                              "I'm here to build your presence online with state of the art web apps.",
                          size: 15.0),
                    )
                  ],
                ),
              ),
              const AnimatedCard(
                path: "assets/webDev.png",
                width: 300.0,
                height: 300.0,
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const AnimatedCard(
                path: "assets/appDev.png",
                width: 300,
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedText(
                      text: "App Development",
                      size: 25,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Wrap(
                      children: [
                      SizedBox(
                        width: widthDevice/2.0,
                        child: const SizedText(
                            text:
                                "Do you need a high performance, responsive and beautiful app? Don't worry I've got you covered.",
                            size: 15.0),
                      ),
                    ])
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedText(
                      text: "Back-end Development",
                      size: 25.0,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: widthDevice/2.0,
                      child: const SizedText(
                          text:
                          "Do you want your back end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                          size: 15.0),
                    )
                  ],
                ),
              ),
              const AnimatedCard(
                path: "assets/firebase.png",
                width: 300.0,
                height: 300.0,
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
