import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/ComingSoon.dart';

import 'pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kitabisa DAMP',
      theme: ThemeData(
        primaryColor: const Color(0xFF1EA0E5),
        fontFamily: 'Roboto',
      ),
      
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
      },

      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const ComingSoonPage(),
      ),
    );
  }
}