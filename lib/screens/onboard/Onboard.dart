import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/screens/home/Home.dart';
import 'package:waggy/screens/onboard/pages/Description.dart';
import 'package:waggy/screens/onboard/pages/Name.dart';
import 'package:waggy/screens/onboard/pages/OnBoardAge.dart';
import 'package:waggy/utils/DataHandler.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

var petData = {};

class _OnboardState extends State<Onboard> {
  var pageNo = 0;
  var currentFocus;

  void setData(key, value) {}

  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  getFocusState(focusState) {
    return focusState;
  }

  var onBoardingWidgets = [
    OnboardName(setData: (key, value) {
      petData = {...petData, key: value};
    }),
    OnBoardAge(setData: (key, value) {
      petData = {...petData, key: value};
    }),
    OnBoardDescription(setData: (key, value) {
      petData = {...petData, key: value};
    })
  ];

  @override
  void initState() {
    super.initState();
    pageNo = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: GestureDetector(
      onTap: unfocus,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColors.PRIMARY_COLOR,
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("assets/images/onboard_bg.png"))),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // if (MediaQuery.of(context).viewInsets.bottom == 0)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 140),
                child: const Image(
                    image: AssetImage("assets/images/logo_transparent.png")),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 450,
                child: onBoardingWidgets[pageNo]),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    bottom: 100,
                  ),
                  child: ClipOval(
                    child: Material(
                      color: AppColors.GRAY_COLOR, // button color
                      child: InkWell(
                        splashColor: AppColors.BLACK_COLOR, // inkwell color
                        child: const SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(Icons.chevron_right)),
                        onTap: () {
                          if (pageNo < onBoardingWidgets.length - 1) {
                            setState(() {
                              pageNo += 1;
                            });
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    ));
  }
}
