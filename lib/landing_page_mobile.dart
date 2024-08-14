import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maxwell_ndungu/components.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
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
            TabsMobile(text: "Home", route: "/"),
            SizedBox(
              height: 20.0,
            ),
            TabsMobile(text: "Works", route: "/works"),
            SizedBox(
              height: 20.0,
            ),
            TabsMobile(text: "Blog", route: "/blog"),
            SizedBox(
              height: 20.0,
            ),
            TabsMobile(text: "About", route: "/about"),
            SizedBox(
              height: 20.0,
            ),
            TabsMobile(text: "Contact", route: "/contact"),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  //onPressed: () async => await
                  //launchUrlString("https://www.instagram.com/_m.a.k.s.y_/"),
                  icon: SvgPicture.asset(
                    "assets/instagram.svg",
                    width: 35.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  //onPressed: () async => await
                  //launchUrlString("https://x.com/maksyn440"),
                  icon: SvgPicture.asset(
                    "assets/twitterx.svg",
                    width: 35.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  //onPressed: () async => await
                  //launchUrlString("https://github.com/Maxwell-016/portfolio-trial"),
                  icon: SvgPicture.asset(
                    "assets/github.svg",
                    width: 35.0,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          //Intro, first section
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 110.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/mydash.png"),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        )),
                    child: Text(
                      "Hello there!",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Text(
                    "I'm Maxwell Ndungu",
                    style: TextStyle(fontSize: 40.0),
                  ),
                  Text(
                    "A Flutter Developer",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 3.0,
                    children: [
                      Icon(Icons.email_outlined),
                      Icon(Icons.call),
                      Icon(Icons.location_pin),
                    ],
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 9.0,
                    children: [
                      Text(
                        "ndungumaxwell057@gmail.com",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text("+254743904449", style: TextStyle(fontSize: 15.0)),
                      Text("14210-00400 Nairobi, Kenya",
                          style: TextStyle(fontSize: 15.0)),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 90.0,
          ),
          //About me, Second section
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "About Me",
                style: TextStyle(fontSize: 40.0),
              ),
              const Text(
                "Hello! I'm Maxwell Ndungu. I specialize in flutter development",
                style: TextStyle(fontSize: 15.0),
              ),
              const Text(
                "I strive to ensure astounding perfomance with state of ",
                style: TextStyle(fontSize: 15.0),
              ),
              const Text(
                "the art security for Android, Ios, Web, Mac, Linux",
                style: TextStyle(fontSize: 15.0),
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
          //What I do, Third Secton
          Column(
            children: [
              Text("What I Do? ",style: TextStyle(fontSize: 40.0),),
              AnimatedCard(path: "assets/webDev.png", text:"Web Development",width: 300.0,),
              SizedBox(height: 35.0,),
              AnimatedCard(path: "assets/appDev.png", text:"App Development",width: 300.0,),
              SizedBox(height: 35.0,),
              AnimatedCard(path: "assets/firebase.png", text:"Back-end Development",width: 300.0,),
              SizedBox(height: 35.0,),
            ],

          )
        ],
      ),
    );
  }
}
