import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:maxwell_ndungu/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  var logger=Logger();
  final formKey=GlobalKey<FormState>();
  final TextEditingController _firstNameController=TextEditingController();
  final TextEditingController _lastNameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _phoneController=TextEditingController();
  final TextEditingController _messageController=TextEditingController();

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
          child: Form(
            key: formKey,
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
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
