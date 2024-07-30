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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(height: 20.0,),
            TabsMobile(text: "Works", route: "/works"),
            SizedBox(height: 20.0,),
            TabsMobile(text: "Blog", route: "/blog"),
            SizedBox(height: 20.0,),
            TabsMobile(text: "About", route: "/about"),
            SizedBox(height: 20.0,),
            TabsMobile(text: "Contact", route: "/contact"),
            SizedBox(height: 40.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () async => await
                  launchUrlString("https://www.instagram.com/_m.a.k.s.y_/"),
                  icon: SvgPicture.asset("assets/instagram.svg",width: 35.0,),
                ),
                IconButton(onPressed: () async => await
                launchUrlString("https://x.com/maksyn440"),
                  icon: SvgPicture.asset("assets/twitterx.svg",width: 35.0,),
                ),
                IconButton(onPressed: () async => await
                launchUrlString("https://github.com/Maxwell-016/portfolio-trial"),
                  icon: SvgPicture.asset("assets/github.svg",width: 35.0,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
