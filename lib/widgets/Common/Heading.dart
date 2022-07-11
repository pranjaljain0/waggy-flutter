import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';

class Heading extends StatelessWidget {
  final label;
  const Heading({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
