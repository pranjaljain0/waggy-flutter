import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({Key? key}) : super(key: key);

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
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
                    "Pet profile",
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
