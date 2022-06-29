import 'package:f_voz/home/screens/about.dart';
import 'package:f_voz/home/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const VozApp());
}

class VozApp extends StatelessWidget {
  const VozApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
