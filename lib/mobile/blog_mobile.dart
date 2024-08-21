import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
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
                  iconTheme: const IconThemeData(
                    size: 35.0,
                    color: Colors.black,
                  ),
                  expandedHeight: 500.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset("assets/blog.jpg",fit: BoxFit.fill,filterQuality: FilterQuality.high,),
                    centerTitle: true,
                    title: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const AbelCustom(
                        text: "WELCOME TO MY BLOG ",
                        size: 24.0,
                        color: Colors.white,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ];
            }, body: ListView(
            children: const [
              BlogPost(),
            ],
          ),

          ),

        ),
    );
  }
}
class BlogPost extends StatefulWidget {
  const BlogPost({super.key});

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.tealAccent,
            width: 2.0
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: const AbelCustom(text: "Who is Maxwell?", size: 25.0,color: Colors.white,),
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      expand=!expand;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),color: Colors.black,),
              ],
            ),
            const SizedBox(height: 20.0,),
            Text("Hi, I'm Maxwell, "
                "a computer science student with a growing obsession for all things mobile development. "
                "Seriously, I can't get enough of it! "
                "There's just something so cool about building apps that people can use and enjoy in their daily lives. "
                "And when it comes to mobile, Flutter has absolutely captured my imagination."
                " The framework is incredibly powerful and versatile, allowing me to create beautiful interfaces, ensure smooth performance, and reach users across different platforms. "
                "I'm on a constant quest to learn and experiment, always looking for new challenges and opportunities to build apps that are both innovative and have a positive impact.",
              style: GoogleFonts.openSans(fontSize: 15.0,),
              maxLines: expand == true? null : 3,
              overflow: expand == true? TextOverflow.visible : TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

