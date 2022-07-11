import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';

class OnBoardDescription extends StatefulWidget {
  final Function setData;
  const OnBoardDescription({Key? key, required this.setData}) : super(key: key);

  @override
  State<OnBoardDescription> createState() => _OnBoardDescriptionState();
}

class _OnBoardDescriptionState extends State<OnBoardDescription> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
      child: Column(
        children: [
          const Text(
            "Describe about you and your pet relationship",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Image(image: AssetImage("assets/images/onboard_2.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: TextField(
              onChanged: (e) {
                widget.setData('description', e);
              },
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 4,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                  hintText: 'Describe it here',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.BLACK_COLOR))),
            ),
          ),
        ],
      ),
    );
  }
}
