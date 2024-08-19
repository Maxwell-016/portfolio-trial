import 'package:flutter/material.dart';
import 'package:maxwell_ndungu/mobile/about_mobile.dart';
import 'package:maxwell_ndungu/mobile/contact_mobile.dart';
import 'package:maxwell_ndungu/mobile/landing_page_mobile.dart';
import 'package:maxwell_ndungu/web/about_web.dart';
import 'package:maxwell_ndungu/web/contact_web.dart';
import 'package:maxwell_ndungu/web/landing_page_web.dart';

class Routes {
  static Route<dynamic> routeMaker(RouteSettings route) {
    switch (route.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return LandingPageWeb();
            } else {
              return LandingPageMobile();
            }
          }),
        );
      case "/contact":
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800)
              return ContactWeb();
            else
              return ContactMobile();
          }),
        );
      case "/about":
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800)
              return AboutWeb();
            else
              return AboutMobile();
          }),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return LandingPageWeb();
            } else {
              return LandingPageMobile();
            }
          }),
        );
    }
  }
}
