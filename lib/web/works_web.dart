import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    double widthDevice=MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
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
                    backgroundImage: AssetImage("myself.jpg",),
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
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return<Widget>[
                SliverAppBar(
                  pinned: true,
                  iconTheme: const IconThemeData(
                    size: 35.0,
                    color: Colors.black,
                    weight: 600.0,
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
                  expandedHeight: 500.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset("works.jpg",filterQuality: FilterQuality.high,fit: BoxFit.cover,),
                  ),
                )
              ];
            },
            body: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 30.0,),
                    const SizedText(text: "Works", size: 40.0,weight: FontWeight.w700,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const AnimatedCard(path: "assets/snapshot.png",height: 200.0,width: 350.0,fit: BoxFit.cover,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedText(text: "Portfolio", size: 30.0,weight: FontWeight.w600,),
                            const SizedBox(height: 20.0,),
                            SizedBox(
                              width: widthDevice/2.0,
                              child: const Text("Deployed on Android, IOS and Web, "
                                  "the portfolio project was truly an achievement,"
                                  " I used flutter to develop the beautiful and responsive UI and Firebase for the back-end."),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
