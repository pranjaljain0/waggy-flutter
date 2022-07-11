import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/screens/AuthScreen.dart';
import 'package:waggy/screens/LoadingHandler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waggy/screens/home/Home.dart';
import 'package:waggy/screens/onboard/Onboard.dart';
import 'package:waggy/utils/DataHandler.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  MethodChannel platform = new MethodChannel('backgroundservice');

  void startService() async {
    dynamic value = await platform.invokeMethod('startService');
  }

  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    void checkShowLoadingStatus(context) async {
      final SharedPreferences prefs = await _prefs;

      if (prefs.getInt("showLoading") == 0) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const AuthScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoadingHandler()));
      }
    }

    Future.delayed(const Duration(milliseconds: 2000), () async {
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user == null) {
          checkShowLoadingStatus(context);
        } else {
          var data = await DataHandler.getUsersPet(uid: user.uid);
          if (data == null) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Onboard(
                      user: user,
                    )));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Home(
                      user: user,
                    )));
          }
        }
      });
    });

    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: AppColors.PRIMARY_COLOR),
          child:
              const Image(image: AssetImage("assets/images/logo_white.png"))),
    );
  }
}
