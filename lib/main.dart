import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:waggy/screens/AuthScreen.dart';
import 'package:waggy/screens/Splash.dart';
import 'package:waggy/screens/home/Home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Splash(),
        '/auth': (context) => const AuthScreen(),
      },
      initialRoute: '/',
      title: 'Waggy',
      theme: ThemeData(
        fontFamily: 'HelveticaNeue',
        brightness: Brightness.light,
        primaryColor: const Color(0xffFFBA1D),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
