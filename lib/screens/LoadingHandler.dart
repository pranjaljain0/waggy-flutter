import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/screens/AuthScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingHandler extends StatefulWidget {
  const LoadingHandler({Key? key}) : super(key: key);

  @override
  State<LoadingHandler> createState() => _LoadingHandlerState();
}

class _LoadingHandlerState extends State<LoadingHandler>
    with TickerProviderStateMixin {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int pageNo = 0;
  bool inset = true;

  void runOnceHandler() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("showLoading", 0);
  }

  late AnimationController _controller_in;
  late AnimationController _controller_out;
  late Animation<Offset> _insetAnimation;
  late Animation<Offset> _offsetAnimation;

  var imageArr = [
    'assets/images/Intro_1.png',
    'assets/images/Intro_2.png',
    'assets/images/Intro_3.png',
  ];

  var textArr = [
    'Sniff out for great dates',
    'Find dog friendly events near you',
    'Get tips from Health blogs',
  ];

  @override
  void initState() {
    super.initState();
    pageNo = 0;
    _controller_in = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _controller_out = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    _insetAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller_in, curve: Curves.easeIn));

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller_out,
      curve: Curves.easeIn,
    ));

    _controller_in.forward();
    _controller_out.forward();
    _controller_in.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        inset = false;
        _controller_out.reset();
      }
    });

    _controller_out.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        inset = true;
        _controller_in.reset();
      }
    });
  }

  @override
  void dispose() {
    _controller_in.dispose();
    _controller_out.dispose();
    super.dispose();
  }

  nextPageHandler() {
    if (pageNo < 2) {
      setState(() {
        pageNo += 1;
        inset = false;
      });
      // _controller_out.forward();
      _controller_in.reset();
      _controller_in.forward();
      _controller_out.reset();
    } else {
      runOnceHandler();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColors.PRIMARY_COLOR),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    runOnceHandler();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                        color: AppColors.WHITE_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 483,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/Intro_bg.png")),
              ),
              child: SlideTransition(
                position: _insetAnimation,
                child: Image(
                  image: AssetImage(imageArr[pageNo]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: Text(
                textArr[pageNo],
                style: const TextStyle(
                    fontSize: 30,
                    color: AppColors.WHITE_COLOR,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      pageNo == 0 ? paginationActive() : paginationInactive(),
                      pageNo == 1 ? paginationActive() : paginationInactive(),
                      pageNo == 2 ? paginationActive() : paginationInactive(),
                    ],
                  ),
                  ClipOval(
                    child: Material(
                      color: AppColors.WHITE_COLOR, // button color
                      child: InkWell(
                        splashColor: AppColors.BLACK_COLOR, // inkwell color
                        child: const SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(Icons.chevron_right)),
                        onTap: () {
                          nextPageHandler();
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

paginationActive() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Container(
      height: 5,
      width: 15,
      decoration: BoxDecoration(
        color: AppColors.WHITE_COLOR,
        borderRadius: BorderRadius.circular(10), // radius of 10
      ),
    ),
  );
}

paginationInactive() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Container(
      height: 5,
      width: 10,
      decoration: BoxDecoration(
        color: AppColors.FADED_WHITE_COLOR,
        borderRadius: BorderRadius.circular(10), // radius of 10
      ),
    ),
  );
}
