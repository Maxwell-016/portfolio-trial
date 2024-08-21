import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components.dart';

class WorksMobile extends StatefulWidget {
  const WorksMobile({super.key});

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) { 
              return<Widget>[
                SliverAppBar(
                  iconTheme: IconThemeData(
                    size: 35.0,
                    color: Colors.black
                  ),
                  expandedHeight: 400.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset("assets/works.jpg",fit: BoxFit.cover,filterQuality: FilterQuality.high,),
                  ),
                )
              ];
            },
            body: ListView(
              children: const [
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30.0,),
                  SizedText(text: "Works", size: 40.0,weight: FontWeight.w700,),
                  SizedBox(height: 30.0,),
                  AnimatedCard(path: "assets/snapshot.png",width: 350.0,height: 170.0,fit: BoxFit.fill,),
                  SizedBox(height: 50.0,),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedText(text: "Portfolio", size: 30.0,weight: FontWeight.w600,),
                        Text("Deployed on Android, IOS and Web, "
                            "the portfolio project was truly an achievement,"
                            " I used flutter to develop the beautiful and responsive UI and Firebase for the back-end."),
                      ],
                    ),
                  )
                ],
              ),
            ]
            ),
            
          ),
        )
    );
  }
}
