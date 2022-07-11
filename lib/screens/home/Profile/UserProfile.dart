import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    "User profile",
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
        ],
      ),
    );
  }
}
