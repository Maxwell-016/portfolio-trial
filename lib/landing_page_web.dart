import 'package:flutter/material.dart';

import 'components.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  tealContainer(String text){
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
      child: Text(text,style: TextStyle(fontSize: 15.0),),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          size: 35.0,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Row(
              children: [
                GestureDetector(
                  child: const SpacedText(
                    text: "Home",
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: const SpacedText(
                    text: "Works",
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: const SpacedText(
                    text: "Blog",
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: const SpacedText(
                    text: "About",
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: const SpacedText(
                    text: "Contact",
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
      drawer: const Drawer(
        child: Column(),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children:[
          Column(
          children: [
            const SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.0,),
                    Container(
                      padding: EdgeInsets.all(7.0),
                      child: Text("Hello there I'm"),
                      decoration: const BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)
                              ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    SizedText(text: "Maxwell Ndungu", size: 40.0,weight: FontWeight.w700,),
                    SizedText(text: "Flutter Developer", size: 20.0),
                    SizedBox(height: 20,),
                    const Row(
                      children: [
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 10,
                          children: [
                            Icon(Icons.email,size: 20.0,),
                            Icon(Icons.phone,size: 20.0,),
                            Icon(Icons.location_on,size: 20.0,),
                          ],
                        ),
                        SizedBox(width: 40.0,),
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 10,
                          children: [
                            SizedText(text: "ndungumaxwell057@gmail.com", size: 15.0),
                            SizedText(text: "+254743904449", size: 15.0),
                            SizedText(text: "14210-00400 Nairobi,Kenya", size: 15.0),
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
            const SizedBox(height: 150,),
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
                    const SizedText(text: "About Me", size: 40.0,weight: FontWeight.w700,),
                    const SizedBox(height: 10.0,),
                    const SizedText(text: "Hello! I'm Maxwell Ndungu I specialize in flutter development.",size: 15,),
                    const SizedText(text: "I strive to ensure astounding performance with state of",size: 15,),
                    const SizedText(text: "the art security for Android, Ios, Web, Mac, Linux and Windows",size: 15,),
                    const SizedBox(height: 15.0,),
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
            const SizedBox(height: 150,),
            const Column(
              children: [
                SizedText(text: "What I Do!", size: 40.0,weight: FontWeight.w700,),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedCard(path: "webDev.png", text: "Web Development",width: 229,height: 250,),
                      AnimatedCardDelayed(path: "appDev.png", text: "App Development",width: 229,height: 250,),
                      AnimatedCard(path: "firebase.png", text: "Back-end Development",width: 229,height: 250,),
                    ],
                  ),
                ),

              ],
            ),
            const SizedBox(height: 150.0,),
            Column(
              children: [
                SizedText(text: "Contact Me", size: 40.0,weight: FontWeight.w700,)
              ],
            )
          ],
                  ),
    ],
      ),
    );
  }
}
