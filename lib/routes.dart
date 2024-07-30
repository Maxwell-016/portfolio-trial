import 'package:flutter/material.dart';
import 'package:maxwell_ndungu/landing_page_mobile.dart';
import 'package:maxwell_ndungu/landing_page_web.dart';

class Routes{
  static Route<dynamic> routeMaker(RouteSettings route){
    switch (route.name){
      case "/":
        return MaterialPageRoute(builder: (_) => LayoutBuilder(builder: (context,constraints){
          if(constraints.maxWidth > 800){
            return LandingPageWeb();
          }
          else {
            return LandingPageMobile();
          }
        }),
        );
      default:
        return MaterialPageRoute(builder: (_) => LayoutBuilder(builder: (context,constraints){
          if(constraints.maxWidth > 800){
            return LandingPageWeb();
          }
          else {
            return LandingPageMobile();
          }
        }),
        );
    }
  }
}