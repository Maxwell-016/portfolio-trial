import 'package:flutter/material.dart';
import 'package:maxwell_ndungu/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (route) => Routes.routeMaker(route),
      initialRoute: "/",
    );
  }
}
