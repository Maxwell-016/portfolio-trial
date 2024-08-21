import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maxwell_ndungu/firebase_options.dart';
import 'package:maxwell_ndungu/routes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async{
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
