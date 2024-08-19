import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
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
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 400.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact.png",
                  fit: BoxFit.fill,
                ),
              ),
              iconTheme: const IconThemeData(
                color: Colors.black,
                size: 35.0,
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              const SizedText(
                text: "Contact Me",
                size: 40,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Wrap(
                runSpacing: 20.0,
                alignment: WrapAlignment.center,
                children: [
                  TextForm(
                      label: "First Name",
                      textHint: "Please type first name",
                      width: widthDevice / 1.4),
                  TextForm(
                      label: "Last Name",
                      textHint: "Please type last name",
                      width: widthDevice / 1.4),
                  TextForm(
                      label: "Email",
                      textHint: "Please type email address",
                      width: widthDevice / 1.4),
                  TextForm(
                      label: "Phone Number",
                      textHint: "Please type phone number",
                      width: widthDevice / 1.4),
                  TextForm(
                    label: "Message",
                    textHint: "Message",
                    width: widthDevice / 1.4,
                    maxLines: 10,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60.0,
                    minWidth: widthDevice / 2.2,
                    color: Colors.tealAccent,
                    child: const SizedText(
                      size: 20.0,
                      text: "Submit",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
