import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maxwell_ndungu/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("myself.jpg"),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const SizedText(text: "Maxwell Ndungu", size: 20),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //instagram
                IconButton(
                  onPressed: () async => {
                    await launchUrlString(
                        "https://www.instagram.com/_m.a.k.s.y_/")
                  },
                  icon: SvgPicture.asset(
                    "instagram.svg",
                    width: 35.0,
                  ),
                ),
                //twitter
                IconButton(
                  onPressed: () async =>
                      {await launchUrlString("https://x.com/maksyn440")},
                  icon: SvgPicture.asset(
                    "twitterx.svg",
                    width: 35.0,
                  ),
                ),
                //github
                IconButton(
                    onPressed: () async =>
                        await launchUrlString("https://github.com/Maxwell-016"),
                    icon: SvgPicture.asset("github.svg"))
              ],
            ),
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
                  "contact.png",
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
              ),
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
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0,),
              const SizedText(text: "Contact me", size: 40.0,weight: FontWeight.w700,),
              const SizedBox(height: 20.0,),
              Wrap(
                direction: Axis.vertical,
                spacing: 30.0,
                alignment: WrapAlignment.center,
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
                  Container(
                    margin: const EdgeInsets.only(left: 200.0),
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 60.0,
                      minWidth: deviceWidth / 2.2,
                      color: Colors.tealAccent,
                      child: const SizedText(
                        text: "Submit",
                        size: 20,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
