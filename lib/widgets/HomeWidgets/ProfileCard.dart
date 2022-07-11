import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/screens/home/Recommendation/ProfilePage.dart';

class ProfileCard extends StatelessWidget {
  final name;
  final handleLike;
  final handleDislike;
  final handleSuperLike;

  const ProfileCard(
      {Key? key,
      required this.name,
      required this.handleLike,
      required this.handleDislike,
      required this.handleSuperLike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: AppColors.WHITE_COLOR,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Image(
                            image: AssetImage("assets/images/dog_1.png"))),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  color: AppColors.WHITE_COLOR,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.verified,
                                color: AppColors.BLUE_COLOR,
                                size: 22,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.male,
                              color: AppColors.WHITE_COLOR,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.WHITE_COLOR),
                              ),
                            ),
                            Icon(
                              Icons.location_on,
                              color: AppColors.WHITE_COLOR,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "2km away",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.WHITE_COLOR),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Material(
                      color: AppColors.GRAY_COLOR, // button color
                      child: InkWell(
                        splashColor: AppColors.WHITE_COLOR, // inkwell color
                        child: const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(
                            Icons.close,
                            color: AppColors.DISLIKE,
                          ),
                        ),
                        onTap: () {
                          handleDislike(name);
                        },
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: AppColors.SUPER_LIKE, // button color
                      child: InkWell(
                        splashColor: AppColors.WHITE_COLOR, // inkwell color
                        child: const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(
                            Icons.star,
                            color: AppColors.WHITE_COLOR,
                          ),
                        ),
                        onTap: () {
                          handleSuperLike(name);
                        },
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: AppColors.RED_COLOR, // button color
                      child: InkWell(
                        splashColor: AppColors.WHITE_COLOR, // inkwell color
                        child: const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.WHITE_COLOR,
                          ),
                        ),
                        onTap: () {
                          handleLike(name);
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
