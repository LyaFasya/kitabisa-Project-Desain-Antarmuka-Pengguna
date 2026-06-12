import 'package:flutter/material.dart';
import 'pages/MainScreen.dart';
import 'pages/EditProfilePage.dart';
import 'pages/Donasi.dart';
import 'pages/DonasiList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kitabisa Clone Berstruktur',
      theme: ThemeData(
        primaryColor: const Color(0xFF1EA0E5),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MainScreen(initialIndex: 0),
        '/profile': (context) => const MainScreen(initialIndex: 4),
        '/edit-profile': (context) => const EditProfilePage(),
        '/donasi': (context) => const DonasiPage(),
        '/donasi-list': (context) => const DonasiListPage(),
        '/inbox': (context) => const MainScreen(initialIndex: 3),
      },
    );
  }
}
