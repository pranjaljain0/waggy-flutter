import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';

class EventCard extends StatelessWidget {
  final Function onClickHandler;
  const EventCard({Key? key, required this.onClickHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: InkWell(
        onTap: () {
          onClickHandler();
        },
        child: SizedBox(
          height: 260,
          width: 260,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                // color: AppColors.BLUE_COLOR,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/event_dog_bg.png")),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(top: 10, right: 10, child: chip("Sports")),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 80,
                  width: 200,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.WHITE_COLOR,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Naaigal Jaakirathai",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.BLACK_COLOR),
                          ),
                          Text("Madivala Market Rd Area",
                              style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      AppColors.BLACK_COLOR.withOpacity(0.6)))
                        ],
                      ),
                      dateChip("02", "Mon", true)
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

Widget dateChip(String date, String day, bool isActive) {
  return Container(
    height: 70,
    width: 45,
    decoration: BoxDecoration(
        gradient: isActive
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.PRIMARY_COLOR_LIGHT,
                  AppColors.PRIMARY_COLOR,
                ],
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.PRIMARY_COLOR.withOpacity(0),
                  AppColors.PRIMARY_COLOR.withOpacity(0),
                ],
              ),
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          date,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isActive
                ? AppColors.WHITE_COLOR
                : AppColors.BLACK_COLOR.withOpacity(0.8),
          ),
        ),
        Text(
          day,
          style: TextStyle(
            fontSize: 12,
            color: isActive
                ? AppColors.WHITE_COLOR
                : AppColors.BLACK_COLOR.withOpacity(0.8),
          ),
        ),
      ],
    ),
    padding: const EdgeInsets.all(10.0),
  );
}

Widget chip(String label) {
  return Container(
    decoration: const BoxDecoration(
        color: AppColors.WHITE_COLOR,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.BLACK_COLOR,
      ),
    ),
    padding: const EdgeInsets.all(10.0),
  );
}
