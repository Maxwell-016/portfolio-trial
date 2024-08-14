import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

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
      child: Text(widget.text,style: TextStyle(fontSize: 30.0,color: Colors.white),),

    );
  }
}

class AnimatedCard extends StatefulWidget {
  final path;
  final text;
  final fit;
  final reverse;
  final height;
  final width;

  const AnimatedCard({super.key, required this.path, required this.text, this.fit, this.reverse, this.height, this.width});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
with SingleTickerProviderStateMixin {
  late AnimationController _controller=AnimationController(duration: Duration(seconds: 2), vsync: this,)..repeat(reverse: true);
  late Animation<Offset> _animation=Tween(begin: Offset(0,0),end: Offset(0,0.2),).animate(_controller);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.path,
                height: widget.height==null? 200:widget.height,
                width: widget.width==null? 200:widget.width,
                fit: widget.fit ==null? null: widget.fit,
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(widget.text,style: TextStyle(fontSize: 20.0),),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

