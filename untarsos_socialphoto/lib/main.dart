import 'package:flutter/material.dart';
import 'screens/splashscreen.dart';
import 'screens/login_page.dart';
import 'screens/homepage.dart';
import 'screens/search.dart';
import 'screens/post.dart';
import 'screens/profile.dart';

void main() {
  runApp(const TarumanagaraSocialApp());
}

class TarumanagaraSocialApp extends StatelessWidget {
  const TarumanagaraSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarumanagara Social',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/post': (context) => const PostPage(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}