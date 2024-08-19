import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  tealContainer(String text) {
    return Container(
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.tealAccent,
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    var cardWidth = deviceWidth / 3.4;
    return Scaffold(
      extendBodyBehindAppBar: false,
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
                backgroundImage: AssetImage("mydash.png"),
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
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              //Introduction
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(7.0),
                        decoration: const BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                        ),
                        child: const Text("Hello there I'm"),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const SizedText(
                        text: "Maxwell Ndungu",
                        size: 40.0,
                        weight: FontWeight.w700,
                      ),
                      const SizedText(text: "Flutter Developer", size: 20.0),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Wrap(
                            direction: Axis.vertical,
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.email,
                                size: 20.0,
                              ),
                              Icon(
                                Icons.phone,
                                size: 20.0,
                              ),
                              Icon(
                                Icons.location_on,
                                size: 20.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 40.0,
                          ),
                          Wrap(
                            direction: Axis.vertical,
                            spacing: 10,
                            children: [
                              SizedText(
                                  text: "ndungumaxwell057@gmail.com",
                                  size: 15.0),
                              SizedText(text: "+254743904449", size: 15.0),
                              SizedText(
                                  text: "14210-00400 Nairobi,Kenya",
                                  size: 15.0),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  //Spacer(),
                  const CircleAvatar(
                    backgroundColor: Colors.tealAccent,
                    radius: 117.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 112.0,
                      backgroundImage: AssetImage("assets/mydash.png"),
                    ),
                  ),
                  //SizedBox(width: 50.0,),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              //About me
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 250,
                    width: 300,
                    child: Image.asset("assets/whatIDo.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedText(
                        text: "About Me",
                        size: 40.0,
                        weight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const SizedText(
                        text:
                            "Hello! I'm Maxwell Ndungu I specialize in flutter development.",
                        size: 15,
                      ),
                      const SizedText(
                        text:
                            "I strive to ensure astounding performance with state of",
                        size: 15,
                      ),
                      const SizedText(
                        text:
                            "the art security for Android, Ios, Web, Mac, Linux and Windows",
                        size: 15,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Wrap(
                        spacing: 7.0,
                        children: [
                          tealContainer("Flutter"),
                          tealContainer("Firebase"),
                          tealContainer("Android"),
                          tealContainer("IOS"),
                          tealContainer("Windows"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              //What I do
              const Column(
                children: [
                  SizedText(
                    text: "What I Do!",
                    size: 40.0,
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedCard(
                          path: "webDev.png",
                          text: "Web Development",
                          width: 210,
                          height: 250,
                        ),
                        AnimatedCardDelayed(
                          path: "appDev.png",
                          text: "App Development",
                          width: 210,
                          height: 250,
                        ),
                        AnimatedCard(
                          path: "firebase.png",
                          text: "Back-end Development",
                          width: 210,
                          height: 250,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 150.0,
              ),
              //Contact me
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedText(
                    text: "Contact Me",
                    size: 40.0,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    runSpacing: 30.0,
                    spacing: 30.0,
                    children: [
                      Wrap(
                        spacing: 50,
                        direction: Axis.horizontal,
                        children: [
                          TextForm(
                              label: "First name",
                              textHint: "Please type first name",
                              width: deviceWidth / 2.4),
                          TextForm(
                              label: "Last name",
                              textHint: "Please type Last name",
                              width: deviceWidth / 2.4),
                        ],
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 50.0,
                        children: [
                          TextForm(
                              label: "Email",
                              textHint: "Please type email address",
                              width: deviceWidth / 2.4),
                          TextForm(
                              label: "Phone number",
                              textHint: "Please type your phone number",
                              width: deviceWidth / 2.4),
                        ],
                      ),
                      TextForm(
                        label: "Message",
                        textHint: "Message",
                        width: (deviceWidth / 1.2) + 50.0,
                        maxLines: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60.0,
                    minWidth: deviceWidth / 2.2,
                    color: Colors.tealAccent,
                    child: SizedText(
                      text: "Submit",
                      size: 20,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
