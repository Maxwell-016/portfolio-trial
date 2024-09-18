import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
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

  var logger=Logger();
  final TextEditingController _firstNameController=TextEditingController();
  final TextEditingController _lastNameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _phoneController=TextEditingController();
  final TextEditingController _messageController=TextEditingController();
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
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
                backgroundImage: AssetImage("myself.jpg"),
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
                      radius: 114.0,
                      backgroundImage: AssetImage("assets/myself.jpg"),
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
                      StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance.collection("details").doc('tdUfdodi8b6sKHSOqmWO').snapshots(),
                          builder: (context,snapshot){
                            if(snapshot.hasError){
                              return Text("Error: ${snapshot.error}");
                            }
                            if(snapshot.hasData){
                              String data= snapshot.data!['about'];
                              return SizedBox(
                                width: 400.0,
                                child:SizedText(text: data, size: 15.0),);
                            }
                            else{
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }
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
              Form(
                key: formKey,
                child: Column(
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
                                controller: _firstNameController,
                                label: "First name",
                                textHint: "e.g. Maxwell",
                                width: deviceWidth / 2.4,
                                validator: (text){
                                  if(text.toString().isEmpty){
                                    return "First name is required";
                                  }
                                  int? parsedValue = int.tryParse(text);
                                  if(parsedValue != null){
                                    return 'Your name cannot be a number';
                                  }
                                  if(RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(text)){
                                    return 'Your name should not contain special characters.i.e. [!@#\$%^&*(),.?":{}|<>]';
                                  }
                                },
                            ),

                            TextForm(
                                controller: _lastNameController,
                                label: "Last name",
                                textHint: "e.g. Ndungu",
                                width: deviceWidth / 2.4,
                              validator: (text){
                                  int? parsedValue=int.tryParse(text);
                                  if(parsedValue != null){
                                    return 'your name cannot be a number';
                                  }
                                  if(RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(text)){
                                    return 'Your name should not contain special characters.i.e. [!@#\$%^&*(),.?":{}|<>]';
                                  }
                              },
                            ),
                          ],
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 50.0,
                          children: [
                            TextForm(
                                controller: _emailController,
                                label: "Email",
                                inputType: TextInputType.emailAddress,
                                textHint: "e.g. ndungumaxwell057@gmail.com",
                                width: deviceWidth / 2.4,
                              validator: (text){
                                if(text.toString().isEmpty){
                                  return "Email is required";
                                }
                                if(!EmailValidator.validate(text)){
                                  return 'Enter a valid e-mail';
                                }
                              },
                            ),
                            TextForm(
                                controller: _phoneController,
                                label: "Phone number",
                                inputType: TextInputType.phone,
                                textHint: "e.g. 0743904449",
                                width: deviceWidth / 2.4,
                                validator: (text){
                                  if(text.toString().isEmpty){
                                    return null;
                                  }
                                  else {
                                    int? parsedValue = int.tryParse(text);
                                    if (parsedValue == null) {
                                      return 'Enter a valid number';
                                    }
                                    if (text
                                        .toString()
                                        .length != 10) {
                                      return 'Enter a valid number';
                                    }
                                  }
                              },
                            ),
                          ],
                        ),
                        TextForm(
                          controller: _messageController,
                          label: "Message",
                          textHint: " minimum of 5 words",
                          width: (deviceWidth / 1.2) + 50.0,
                          maxLines: 5,
                          validator: (text){
                            if(text.toString().isEmpty){
                              return "Message is required";
                            }
                            List<String> words = text.trim().split(RegExp(r'\s+'));
                            if(words.length < 5){
                              return 'message should have a minimum of 5 words';
                            }
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 200.0),
                          child: MaterialButton(
                            onPressed: () async{
                              final addData = AddData();
                              if(formKey.currentState!.validate()){
                                await addData.addDetails(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _emailController.text,
                                    _phoneController.text,
                                    _messageController.text);
                                formKey.currentState!.reset();
                                dialogError(context);
                              }
                              //logger.d(_firstNameController.text);
                            },
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
