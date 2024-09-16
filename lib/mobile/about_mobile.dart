import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  tealContainer(String text) {
    return Container(
      padding: EdgeInsets.all(7.0),
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            size: 35.0,
            color: Colors.black,
          ),
        ),
        endDrawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, //gives a circular shape

                    //borderRadius: BorderRadius.circular(50.0),
                    //border: Border.all(width: 1.0,color: Colors.black)  gives the border color
                  ),
                  child: Image.asset("assets/mydash.png"),
                ),
              ),
              const TabsMobile(text: "Home", route: "/"),
              const SizedBox(
                height: 20.0,
              ),
              const TabsMobile(text: "Works", route: "/works"),
              const SizedBox(
                height: 20.0,
              ),
              const TabsMobile(text: "Blog", route: "/blog"),
              const SizedBox(
                height: 20.0,
              ),
              const TabsMobile(text: "About", route: "/about"),
              const SizedBox(
                height: 20.0,
              ),
              const TabsMobile(text: "Contact", route: "/contact"),
              const SizedBox(
                height: 40.0,
              ),
              //social media pages
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async => await launchUrlString(
                        "https://www.instagram.com/_m.a.k.s.y_/"),
                    icon: SvgPicture.asset(
                      "assets/instagram.svg",
                      width: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async =>
                        await launchUrlString("https://x.com/maksyn440"),
                    icon: SvgPicture.asset(
                      "assets/twitterx.svg",
                      width: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async =>
                        await launchUrlString("https://github.com/Maxwell-016"),
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      width: 35.0,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            const CircleAvatar(
              radius: 117.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 113.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/myself.jpg"),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "About Me",
                        style: TextStyle(fontSize: 40.0),
                      ),
                      StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance.collection("details").doc('tdUfdodi8b6sKHSOqmWO').snapshots(),
                          builder: (context,snapshot){
                            if(snapshot.hasError){
                              return Text("Error: ${snapshot.error}");
                            }
                            if(snapshot.hasData){
                              String data= snapshot.data!['about'];
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                child: SizedText(text: data, size: 15.0),
                              );
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
                        spacing: 4.0,
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
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
            //web development
            const Column(
              children: [
                AnimatedCard(
                  path: "assets/webDev.png",
                  width: 300.0,
                  height: 300.0,
                ),
                SizedBox(
                  height: 90.0,
                ),
                SizedText(
                  text: "Web Development",
                  size: 25.0,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedText(text: "I'm here to build your presence online with state of the art web apps.", size: 15.0),
                )
              ],
            ),
            //app development
            const Column(
              children: [
                AnimatedCard(
                  path: "assets/appDev.png",
                  width: 300,
                  height: 300,
                ),
                SizedBox(
                  height: 90.0,
                ),
                SizedText(
                  text: "App Development",
                  size: 25,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedText(text: "Do you need a high performance, responsive and beautiful app? Don't worry I've got you covered.", size: 15.0),
                )
              ],
            ),
            const SizedBox(height: 20.0,),
            //back-end development
            const Column(
              children: [
                AnimatedCard(
                  path: "assets/firebase.png",
                  width: 300,
                  height: 300,
                ),
                SizedBox(
                  height: 90.0,
                ),
                SizedText(
                  text: "Back-end Development",
                  size: 25,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedText(text: "Do you want your back end to be highly scalable and secure? Let's have a conversation on how I can help you with that.", size: 15.0),
                )
              ],
            ),
            const SizedBox(height: 20.0,),

          ],
        ),
      ),
    );
  }
}
