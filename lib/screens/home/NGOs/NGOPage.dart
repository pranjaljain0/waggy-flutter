import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/widgets/NGOWidgets/NGOItem.dart';

class NGOPage extends StatefulWidget {
  const NGOPage({Key? key}) : super(key: key);

  @override
  State<NGOPage> createState() => _NGOPageState();
}

class _NGOPageState extends State<NGOPage> {
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
        NGOItem(),
        NGOItem(),
        NGOItem(),
        NGOItem(),
      ],
    );
  }
}
