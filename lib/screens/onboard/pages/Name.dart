import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';

class OnboardName extends StatefulWidget {
  final Function setData;
  const OnboardName({Key? key, required this.setData}) : super(key: key);

  @override
  State<OnboardName> createState() => _OnboardNameState();
}

class _OnboardNameState extends State<OnboardName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
          child: Image(image: AssetImage("assets/images/onboard_1.png")),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
          child: TextField(
            onChanged: (e) {
              widget.setData('name', e);
            },
            style: const TextStyle(fontSize: 16),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                hintText: 'Enter your dog name',
                labelText: "Pet Name",
                labelStyle: TextStyle(
                  color: AppColors.BLACK_COLOR,
                  fontSize: 20,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.BLACK_COLOR))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
          child: TextField(
            onChanged: (e) {
              widget.setData('type', e);
            },
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
                hintText: 'Enter your dog\'s breed',
                labelText: "Pet Type",
                labelStyle: TextStyle(
                  color: AppColors.BLACK_COLOR,
                  fontSize: 20,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.BLACK_COLOR))),
          ),
        ),
      ],
    );
  }
}
