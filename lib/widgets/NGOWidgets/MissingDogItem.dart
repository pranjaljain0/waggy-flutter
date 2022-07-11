import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/widgets/Common/Heading.dart';

class MissingDogItem extends StatelessWidget {
  const MissingDogItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.BLACK_COLOR),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 32.0,
                        height: 32.0,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Posted guy name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 16,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text("Location")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "looking for volunteers and donations",
                    style: TextStyle(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tempus lacus in quam laoreet, eget finibus orci pharetra. Se",
                      style: TextStyle(
                          color: AppColors.BLACK_COLOR.withOpacity(0.5))),
                ],
              ),
            ),
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image(
                        width: MediaQuery.of(context).size.width - 20,
                        fit: BoxFit.cover,
                        image:
                            const AssetImage("assets/images/missing_dog.png"))),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: ClipOval(
                    child: Material(
                      color: AppColors.GRAY_COLOR, // button color
                      child: InkWell(
                        splashColor: AppColors.BLACK_COLOR, // inkwell color
                        child: SizedBox(
                            width: 45,
                            height: 45,
                            child: Center(
                              child: Transform.rotate(
                                  angle: 43,
                                  child: const Icon(Icons.send_rounded)),
                            )),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
