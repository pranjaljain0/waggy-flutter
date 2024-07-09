import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/screens/Splash.dart';
import 'package:waggy/screens/home/Profile/UserProfile.dart';
import 'package:waggy/screens/home/Profile/UserSettings.dart';
import 'package:waggy/utils/Authenticaton.dart';
import 'package:waggy/widgets/Common/Heading.dart';

class ProfilePane extends StatefulWidget {
  const ProfilePane({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePane> createState() => _ProfilePaneState();
}

class _ProfilePaneState extends State<ProfilePane> {
  _signOut(context) {
    // Authentication.signOut(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                      color: AppColors.WHITE_COLOR,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.notifications,
                        color: AppColors.WHITE_COLOR,
                        size: 24,
                      )),
                )
              ],
            ),
          ),
          decoration: const BoxDecoration(color: AppColors.PRIMARY_COLOR),
        ),
        Expanded(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 140,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 140.0,
                      height: 140.0,
                      decoration: BoxDecoration(
                        color: AppColors.WHITE_COLOR,
                        image: const DecorationImage(
                          image: AssetImage("assets/images/dog_1.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80.0)),
                        border: Border.all(
                          color: AppColors.PRIMARY_COLOR,
                          width: 4.0,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: ClipOval(
                        child: Material(
                          color: AppColors.PRIMARY_COLOR,
                          child: SizedBox(
                            width: 45,
                            height: 45,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.BLACK_COLOR,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Karan Chabbara",
                style: TextStyle(
                    color: AppColors.BLACK_COLOR,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                "Profile photo must be of you",
                style: TextStyle(
                  color: AppColors.BLACK_COLOR.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    const Heading(label: "Pet profiles"),
                    SizedBox(
                      height: 100,
                      width: double.infinity - 40,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: AppColors.PRIMARY_COLOR,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: AppColors.PRIMARY_COLOR,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.BLACK_COLOR
                                            .withOpacity(0.5),
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            profileMenuButton("Edit user profile", () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserProfile()),
                              );
                            }),
                            profileMenuButton("Settings", () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserSettings()),
                              );
                            }),
                            profileMenuButton("Contact us", () {})
                          ],
                        ))
                  ],
                )),
          ],
        )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: InkWell(
            onTap: () {
              _signOut(context);
            },
            child: Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.PRIMARY_COLOR,
              ),
              child: const Text(
                "LOGOUT",
                style: TextStyle(
                    color: AppColors.WHITE_COLOR, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget profileMenuButton(String label, Function onClick) {
  return InkWell(
    onTap: () {
      onClick();
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: AppColors.BLACK_COLOR.withOpacity(0.5)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: AppColors.BLACK_COLOR,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.chevron_right)
        ],
      ),
    ),
  );
}
