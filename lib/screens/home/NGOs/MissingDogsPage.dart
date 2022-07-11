import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/widgets/NGOWidgets/MissingDogItem.dart';

class MissingDogsPage extends StatefulWidget {
  const MissingDogsPage({Key? key}) : super(key: key);

  @override
  State<MissingDogsPage> createState() => _MissingDogsPageState();
}

class _MissingDogsPageState extends State<MissingDogsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            cursorHeight: 20,
            autofocus: false,
            decoration: InputDecoration(
              labelText: "Search NGO's",
              fillColor: AppColors.BLACK_COLOR.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.search),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: AppColors.BLACK_COLOR.withOpacity(0.1), width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: AppColors.BLACK_COLOR.withOpacity(0.1), width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: AppColors.BLACK_COLOR.withOpacity(0.1), width: 0),
              ),
            ),
          ),
        ),
        MissingDogItem(),
        MissingDogItem(),
        MissingDogItem(),
        MissingDogItem(),
      ],
    );
  }
}
