import "package:flutter/material.dart";
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/screens/home/Home.dart';
import 'package:waggy/screens/onboard/Onboard.dart';
import 'package:waggy/utils/Authenticaton.dart';
import 'package:waggy/utils/DataHandler.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var emailAddress = "";
  var password = "";
  var loading = false;
  var errorMessage = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var currentFocus;

  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  void initState() {
    emailAddress = "";
    password = "";
    super.initState();
  }

  @override
  void dispose() {
    print("disposed");
    super.dispose();
  }

  // void handleGoogleLogin(context) async {
  //   User? user = await Authentication.signInWithGoogle(context: context);

  //   if (user != null) {
  //     DataHandler.signUpDataInsertion(uid: user.uid, data: {
  //       'displayName': user.displayName,
  //       'email': user.email,
  //       'emailVerified': user.emailVerified,
  //       'photoURL': user.photoURL,
  //       'uid': user.uid
  //     });
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => Home(
  //                 user: user,
  //               ),
  //           maintainState: false),
  //     );
  //   }
  // }

  void handleFacebookLogin() {}

  // void handlePasswordBasedAuth(emailAddress, password) async {
  //   setState(() {
  //     loading = true;
  //   });

  //   try {
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: emailAddress, password: password)
  //         .then((value) => {
  //               Navigator.pushReplacement(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => Home(
  //                           user: value.user!,
  //                         )),
  //               )
  //             });
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       loading = false;
  //       errorMessage = "";
  //     });
  //     if (e.code == 'user-not-found') {
  //       try {
  //         await FirebaseAuth.instance
  //             .createUserWithEmailAndPassword(
  //               email: emailAddress,
  //               password: password,
  //             )
  //             .then((value) => {
  //                   DataHandler.signUpDataInsertion(
  //                       uid: value.user!.uid,
  //                       data: {
  //                         'displayName': value.user!.displayName,
  //                         'email': value.user!.email,
  //                         'emailVerified': value.user!.emailVerified,
  //                         'photoURL': value.user!.photoURL,
  //                         'uid': value.user!.uid,
  //                         // 'location':new
  //                       }),
  //                   Navigator.pushReplacement(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) => Onboard(
  //                               user: value.user!,
  //                             )),
  //                   )
  //                 });
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'weak-password') {
  //           setState(() {
  //             errorMessage = 'The password provided is too weak.';
  //           });
  //         } else if (e.code == 'email-already-in-use') {
  //           setState(() {
  //             errorMessage = 'The account already exists for that email.';
  //           });
  //         }
  //       } catch (e) {
  //         setState(() {
  //           errorMessage = 'Some unknown error occoured.';
  //         });
  //         // print(e);
  //       }
  //     } else if (e.code == 'wrong-password') {
  //       setState(() {
  //         errorMessage = 'Wrong password provided for that user.';
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: GestureDetector(
            onTap: unfocus,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 130, 0, 60),
                    child: Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/icon.png"))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          emailAddress = value;
                        });
                      },
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          hintText: "Enter your email address or phone number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 40),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: const Text("Forgot password?"),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
                      child: InkWell(
                        onTap: () {
                          if (!loading) {}
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          child: loading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.PRIMARY_COLOR,
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                  "CONTINUE",
                                  style:
                                      TextStyle(color: AppColors.WHITE_COLOR),
                                )),
                          decoration: BoxDecoration(
                            color: !loading
                                ? AppColors.PRIMARY_COLOR
                                : AppColors.WHITE_COLOR.withOpacity(0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 40,
                            height: 0,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color:
                                        AppColors.BLACK_COLOR.withOpacity(0.5)),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Or sign up with social profiles",
                            style: TextStyle(
                                color: AppColors.BLACK_COLOR.withOpacity(0.5)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 40,
                            height: 0,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color:
                                        AppColors.BLACK_COLOR.withOpacity(0.5)),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.GOOGLE_BLUE,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          "Google",
                          style: TextStyle(color: AppColors.WHITE_COLOR),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.FACEBOOK_BLUE,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Facebook",
                        style: TextStyle(color: AppColors.WHITE_COLOR),
                      ),
                    ),
                  ),
                  if (errorMessage != "")
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 40),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            errorMessage,
                            style: const TextStyle(color: AppColors.RED_COLOR),
                          ),
                        )),
                ],
              ),
            ),
          ),
        ));
  }
}
