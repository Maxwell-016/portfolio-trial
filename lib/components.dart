import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key,required this.text,required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
        color: Colors.black,
        height: 50.0,
        minWidth: 200.0,
        onPressed: (){},
      child: Text(widget.text,style: GoogleFonts.lilitaOne(fontSize: 30.0,color: Colors.white),),

    );
  }
}
