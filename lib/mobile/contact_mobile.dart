import 'package:email_validator/email_validator.dart';
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
  final formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                backgroundColor: Colors.transparent,
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
                Form(
                  key: formKey,
                  child: Wrap(
                    runSpacing: 20.0,
                    alignment: WrapAlignment.center,
                    children: [
                      TextForm(
                        controller: _firstNameController,
                        label: "First Name",
                        textHint: "e.g. Maxwell",
                        width: widthDevice / 1.4,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "First name is required";
                          }
                          int? parsedValue = int.tryParse(text);
                          if (parsedValue != null) {
                            return 'Your name cannot be a number';
                          }
                          if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(text)) {
                            return 'Remove special characters.i.e.[!@#\$%^&*(),.?":{}|<>]';
                          }
                        },
                      ),
                      TextForm(
                        controller: _lastNameController,
                        label: "Last Name",
                        textHint: "e.g. Ndungu",
                        width: widthDevice / 1.4,
                        validator: (text) {
                          int? parsedValue = int.tryParse(text);
                          if (parsedValue != null) {
                            return 'your name cannot be a number';
                          }
                          if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(text)) {
                            return 'Remove special characters.i.e.[!@#\$%^&*(),.?":{}|<>]';
                          }
                        },
                      ),
                      TextForm(
                        controller: _emailController,
                        label: "Email",
                        inputType: TextInputType.emailAddress,
                        textHint: "e.g. ndungumaxwell057@gmail.com",
                        width: widthDevice / 1.4,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Email is required";
                          }
                          if (!EmailValidator.validate(text)) {
                            return 'Enter a valid e-mail';
                          }
                        },
                      ),
                      TextForm(
                        controller: _phoneController,
                        label: "Phone number",
                        inputType: TextInputType.phone,
                        textHint: "e.g. 0743904449",
                        width: widthDevice / 1.4,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return null;
                          } else {
                            int? parsedValue = int.tryParse(text);
                            if (parsedValue == null) {
                              return 'Enter a valid number';
                            }
                            if (text.toString().length != 10) {
                              return 'Enter a valid number';
                            }
                          }
                        },
                      ),
                      TextForm(
                        controller: _messageController,
                        label: "Message",
                        textHint: " minimum of 5 words",
                        width: widthDevice / 1.4,
                        maxLines: 10,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Message is required";
                          }
                          List<String> words = text.trim().split(RegExp(r'\s+'));
                          if (words.length < 5) {
                            return 'message has less than 5 words';
                          }
                        },
                      ),
                      MaterialButton(
                        onPressed: () async{
                          final addData = AddData();
                          if(formKey.currentState!.validate()){
                            await addData.addDetails(
                                _firstNameController.text,
                                _lastNameController.text,
                                _emailController.text,
                                _phoneController.text,
                                _messageController.text);

                            dialogError(context);
                            setState(() {
                              _firstNameController.clear();
                              _lastNameController.clear();
                              _emailController.clear();
                              _phoneController.clear();
                              _messageController.clear();
                            });
                          }
                          //logger.d(_firstNameController.text);
                        },
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
                ),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
