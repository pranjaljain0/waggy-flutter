import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/screens/home/events/EventPage.dart';
import 'package:waggy/widgets/Common/Heading.dart';
import 'package:waggy/widgets/EventWidgets/EventCard.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  onClickHandler() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EventPage()),
    );
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
                Icon(
                  Icons.location_on,
                  color: AppColors.WHITE_COLOR,
                  size: 20,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Koramangala, Bangalore",
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
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    cursorHeight: 20,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Search events',
                      fillColor: AppColors.BLACK_COLOR.withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.BLACK_COLOR.withOpacity(0.1),
                            width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.BLACK_COLOR.withOpacity(0.1),
                            width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.BLACK_COLOR.withOpacity(0.1),
                            width: 0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        const Positioned(
                          child: Heading(label: "For you"),
                          top: 0,
                          left: 0,
                        ),
                        Positioned.fromRect(
                            rect: Rect.fromLTWH(0, 40,
                                MediaQuery.of(context).size.width - 40, 110),
                            // bottom: 0,
                            // left: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.PRIMARY_COLOR_LIGHT,
                                      AppColors.PRIMARY_COLOR,
                                    ],
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Event Reminder",
                                      style: TextStyle(
                                          color: AppColors.WHITE_COLOR,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: Text(
                                        "Book your event ticket for your dog's entertainment",
                                        style: TextStyle(
                                            color: AppColors.WHITE_COLOR
                                                .withOpacity(.6)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        const Positioned(
                            right: 20,
                            top: 0,
                            child: Image(
                              image: AssetImage("assets/images/event_dog.png"),
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Heading(label: "Upcoming Events"),
                      Text(
                        "See more",
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      dateChip("02", "Mon", false),
                      dateChip("03", "Tue", false),
                      dateChip("04", "Wed", true),
                      dateChip("05", "Thu", false),
                      dateChip("06", "Fri", false),
                      dateChip("07", "Sat", false),
                      dateChip("08", "Sun", false),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        chip("All", true),
                        chip("Sports", false),
                        chip("Adventures", false),
                        chip("Art", false),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EventCard(
                          onClickHandler: onClickHandler,
                        ),
                        EventCard(
                          onClickHandler: onClickHandler,
                        ),
                        EventCard(
                          onClickHandler: onClickHandler,
                        ),
                        EventCard(
                          onClickHandler: onClickHandler,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
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

Widget chip(String label, bool isActive) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Container(
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
                      AppColors.BLACK_COLOR.withOpacity(0.1),
                      AppColors.BLACK_COLOR.withOpacity(0.1),
                    ],
                  ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: isActive
                ? AppColors.WHITE_COLOR
                : AppColors.BLACK_COLOR.withOpacity(0.6),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
  );
}
