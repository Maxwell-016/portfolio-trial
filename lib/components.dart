import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
//import 'package:google_fonts/google_fonts.dart';

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, required this.text, required this.route});

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
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: Text(
        widget.text,
        style: const TextStyle(fontSize: 30.0, color: Colors.white),
      ),
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final path;
  final text;
  final fit;
  final reverse;
  final double? height;
  final double? width;

  const AnimatedCard({
    super.key,
    required this.path,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _animation = Tween(begin: const Offset(0, 0), end: const Offset(0, 0.2))
        .animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _controller.stop();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.tealAccent,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.path,
                height: widget.height == null ? 200.0 : widget.height,
                width: widget.width == null ? 200.0 : widget.width,
                fit: widget.fit == null ? null : widget.fit,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: widget.text == null
                    ? SizedBox()
                    : SizedText(text: widget.text, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedCardDelayed extends StatefulWidget {
  final path;
  final text;
  final fit;
  final reverse;
  final height;
  final width;
  const AnimatedCardDelayed({
    super.key,
    required this.path,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  });

  @override
  State<AnimatedCardDelayed> createState() => _AnimatedCardDelayedState();
}

class _AnimatedCardDelayedState extends State<AnimatedCardDelayed>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )
      ..repeat(reverse: true)
      ..addListener(() {
        if (mounted) setState(() {});
      });
    _animation = Tween(begin: const Offset(0, 0), end: const Offset(0, 0.2))
        .animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.path,
                height: widget.height ?? 200,
                width: widget.width ?? 200,
                fit: widget.fit,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: widget.text == null
                    ? SizedBox()
                    : SizedText(text: widget.text, size: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WebTabs extends StatefulWidget {
  final text;
  final route;
  const WebTabs({super.key, required this.text, required this.route});

  @override
  State<WebTabs> createState() => _WebTabsState();
}

class _WebTabsState extends State<WebTabs> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (event) {
          setState(() {
            isSelected = false;
          });
        },
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: isSelected ? 25.0 : 20.0,
            decoration: isSelected ? TextDecoration.underline : null,
            decorationColor: isSelected ? Colors.tealAccent : null,
            decorationThickness: isSelected ? 2.0 : null,
          ),
        ),
      ),
    );
  }
}

class SizedText extends StatefulWidget {
  final String text;
  final double size;
  final weight;
  const SizedText(
      {super.key, required this.text, required this.size, this.weight});

  @override
  State<SizedText> createState() => _SizedTextState();
}

class _SizedTextState extends State<SizedText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      overflow: TextOverflow.visible,
      style: TextStyle(
          fontSize: widget.size,
          fontWeight: widget.weight == null ? null : widget.weight),
    );
  }
}

class TextForm extends StatelessWidget {
  final label;
  final textHint;
  final double width;
  final maxLines;
  final controller;
  final validator;
  final inputType;

  const TextForm({super.key,
    required this.label,
    required this.textHint,
    required this.width,
    this.maxLines,
    this.controller,
    this.validator,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        validator: validator == null ? null : validator,
        controller: controller == null ? null : controller,
        maxLines: maxLines == null ? null :maxLines,
        keyboardType: inputType == null? null: inputType,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            overflow: TextOverflow.visible,
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.tealAccent, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.tealAccent, width: 2.0),
          ),
          contentPadding: const EdgeInsets.all(10.0),
          label: Text(label),
          hintText: textHint,
        ),
      ),
    );
  }
}

class AbelCustom extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? weight;
  const AbelCustom(
      {super.key,
      required this.text,
      required this.size,
      this.color,
      this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color == null ? Colors.black : color,
        fontWeight: weight == null ? FontWeight.normal : weight,
      ),
    );
  }
}

class AddData{
  var logger=Logger();
  CollectionReference details=FirebaseFirestore.instance.collection("Customer details");
  Future<void> addDetails(final firstName,final lastName,final email,final phoneNumber,final message){
    return details.add({
      'First Name': firstName,
      'Last Name': lastName,
      'Email': email,
      'Phone Number': phoneNumber,
      'Message':message
    }).then((success)=>logger.d("Success")).catchError((error)=>logger.d(error));
  }
}

Future dialogError(BuildContext context){
  return showDialog(context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: const SizedText(size: 20,text: "Submitted Successfully",weight: FontWeight.w600,),
      ));
}

