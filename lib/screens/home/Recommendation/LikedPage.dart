import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';

class LikedPage extends StatelessWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        decoration: const BoxDecoration(color: AppColors.PRIMARY_COLOR),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "It’s perfect match",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.WHITE_COLOR),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "You and Cash have liked each other.",
                    style:
                        TextStyle(fontSize: 14, color: AppColors.WHITE_COLOR),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
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
                              color: AppColors.WHITE_COLOR,
                              width: 4.0,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: AppColors.WHITE_COLOR,
                            image: const DecorationImage(
                              image: AssetImage("assets/images/dog_2.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(80.0)),
                            border: Border.all(
                              color: AppColors.WHITE_COLOR,
                              width: 4.0,
                            ),
                          ),
                        ),
                      ),
                      const ClipOval(
                        child: Material(
                          color: AppColors.WHITE_COLOR,
                          child: SizedBox(
                            width: 78,
                            height: 78,
                            child: Icon(
                              Icons.favorite,
                              color: AppColors.RED_COLOR,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
            Column(
              children: [
                InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration:
                            const BoxDecoration(color: AppColors.WHITE_COLOR),
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Message",
                            style: TextStyle(fontSize: 16),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Keep Swiping",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.WHITE_COLOR),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
