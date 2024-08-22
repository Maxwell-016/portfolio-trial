import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components.dart';

class BlogWeb extends StatefulWidget {
  const BlogWeb({super.key});

  @override
  State<BlogWeb> createState() => _BlogWebState();
}

class _BlogWebState extends State<BlogWeb> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        endDrawer: Drawer(
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
          },
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("articles").snapshots(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot documentSnapshot= snapshot.data!.docs[index];
                    return BlogPage(title: documentSnapshot["title"], body: documentSnapshot["body"]);
                  },
                );
              }
              else {
                return
                const Center(
                child: CircularProgressIndicator(),
              );
              }
            }
          ),

    ),
      )
    );
  }
}
class BlogPage extends StatefulWidget {
  final String title;
  final String body;
  const BlogPage({super.key, required this.title, required this.body});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool convert= false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.tealAccent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: AbelCustom(text: widget.title, size: 25.0,color: Colors.white,),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      convert = !convert;
                    });
                  },
                      icon: Icon(Icons.arrow_drop_down_circle_outlined),
                  color: Colors.black,)
                ],
              ),
              SizedBox(height: 40.0,),
              Text(widget.body,
                style: GoogleFonts.openSans(fontSize: 15.0,),
                maxLines: convert == true? null : 3,
                overflow: convert == true? TextOverflow.visible : TextOverflow.ellipsis,)
            ],
          ),
        ),
      ),
    );
  }
}

