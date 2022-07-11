import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _dynamicChips = [
      'Health',
      'Food',
      'Nature',
      "Traveller",
      "Beach lover"
    ];

    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 440,
              child: Stack(
                children: [
                  const SizedBox(
                    height: 400,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0),
                        ),
                        child: Image(
                          image: AssetImage("assets/images/dog_3.png"),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    top: 20 + 32,
                    left: 20,
                    child: ClipOval(
                      child: Material(
                        color: AppColors.GRAY_COLOR, // button color
                        child: InkWell(
                          splashColor: AppColors.BLACK_COLOR, // inkwell color
                          child: const SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(Icons.chevron_left)),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Material(
                                  color: AppColors.GRAY_COLOR, // button color
                                  child: InkWell(
                                    splashColor:
                                        AppColors.WHITE_COLOR, // inkwell color
                                    child: const SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.close,
                                        color: AppColors.DISLIKE,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                              ClipOval(
                                child: Material(
                                  color: AppColors.SUPER_LIKE, // button color
                                  child: InkWell(
                                    splashColor:
                                        AppColors.WHITE_COLOR, // inkwell color
                                    child: const SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Icon(
                                        Icons.star,
                                        color: AppColors.WHITE_COLOR,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                              ClipOval(
                                child: Material(
                                  color: AppColors.RED_COLOR, // button color
                                  child: InkWell(
                                    splashColor:
                                        AppColors.WHITE_COLOR, // inkwell color
                                    child: const SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.favorite,
                                        color: AppColors.WHITE_COLOR,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Brown",
                                style: TextStyle(
                                    color: AppColors.BLACK_COLOR,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
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
                                color: AppColors.BLACK_COLOR,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "Male",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.BLACK_COLOR),
                                ),
                              ),
                              Icon(
                                Icons.location_on,
                                color: AppColors.BLACK_COLOR,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "2km away",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.BLACK_COLOR),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: Material(
                              color: AppColors.PRIMARY_COLOR, // button color
                              child: InkWell(
                                splashColor:
                                    AppColors.WHITE_COLOR, // inkwell color
                                child: const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Center(
                                        child: Text("3",
                                            style: TextStyle(
                                                color: AppColors.WHITE_COLOR,
                                                fontWeight: FontWeight.bold)))),
                                onTap: () {},
                              ),
                            ),
                          ),
                          const Text(
                            "Similarities",
                            style: TextStyle(color: AppColors.PRIMARY_COLOR),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  heading("About"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "If you are looking for somebody who can never keep you unattended, cash is your guy. Cash is somebody who loves making new friends. Being a traveller and explorer at heart he will definitely make sure that you are never bored.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "3 ft tall, Brown colour, Labrador,",
                      style: TextStyle(
                          color: AppColors.PRIMARY_COLOR,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  heading("Interest"),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: <Widget>[
                        chip('Health'),
                        chip('Food'),
                        chip('Loves Car Ride'),
                        chip('Sports'),
                        chip('Nature'),
                        chip('Learn'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  heading("Dog Owner"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Name: Maya"),
                            Text("Age: 24"),
                            Text("Occupation: Data Analyst")
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget chip(String label) {
  return Container(
    decoration: const BoxDecoration(
        color: AppColors.PRIMARY_COLOR,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    padding: const EdgeInsets.all(10.0),
  );
}

Widget heading(String label) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      label,
      style: const TextStyle(
          color: AppColors.BLACK_COLOR,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    ),
  );
}
