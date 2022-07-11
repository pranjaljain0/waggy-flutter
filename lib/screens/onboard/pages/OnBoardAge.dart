import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:waggy/constants/Colors.dart';

class OnBoardAge extends StatefulWidget {
  final Function setData;
  const OnBoardAge({Key? key, required this.setData}) : super(key: key);

  @override
  State<OnBoardAge> createState() => _OnBoardAgeState();
}

class _OnBoardAgeState extends State<OnBoardAge> {
  int _currentValue = 3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Select your dogs age",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        NumberPicker(
          textStyle: const TextStyle(color: AppColors.GRAY_COLOR, fontSize: 20),
          selectedTextStyle:
              const TextStyle(color: AppColors.BLACK_COLOR, fontSize: 24),
          value: _currentValue,
          minValue: 0,
          maxValue: 20,
          onChanged: (value) => {
            setState(() => _currentValue = value),
            widget.setData('age', value)
          },
        ),
      ],
    );
  }
}
