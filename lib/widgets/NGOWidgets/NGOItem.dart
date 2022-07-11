import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/widgets/Common/Heading.dart';

class NGOItem extends StatelessWidget {
  const NGOItem({Key? key}) : super(key: key);

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
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image(
                    width: MediaQuery.of(context).size.width - 20,
                    fit: BoxFit.cover,
                    image: const AssetImage("assets/images/NGO_bg.png"))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Heading(label: "Pawfect"),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "looking for volunteers and donations",
                    style: TextStyle(),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      child: Container(
                          child: const Text(
                            "More Info",
                            style: TextStyle(color: AppColors.WHITE_COLOR),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: const BoxDecoration(
                              color: AppColors.PRIMARY_COLOR)),
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
