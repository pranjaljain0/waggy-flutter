import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/screens/home/NGOs/MissingDogsPage.dart';
import 'package:waggy/screens/home/NGOs/ngopage.dart';
import 'package:waggy/widgets/NGOWidgets/NGOItem.dart';

class NGOPane extends StatefulWidget {
  const NGOPane({Key? key}) : super(key: key);

  @override
  State<NGOPane> createState() => _NGOPaneState();
}

class _NGOPaneState extends State<NGOPane> {
  //  var dropdownvalue = 0;
  var dropdownvalue = "NGO";

  // List of items in our dropdown menu
  var panes = const [
    // 'NGO',
    // 'Missing Dogs',
    NGOPage(),
    MissingDogsPage(),
  ];

  var items = [
    'NGO',
    'Missing Dogs',
  ];

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
              children: [
                DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.WHITE_COLOR,
                  ),
                  dropdownColor: AppColors.PRIMARY_COLOR,
                  selectedItemBuilder: (BuildContext context) {
                    return items.map<Widget>((String item) {
                      return Center(
                        child: Text(item,
                            style: const TextStyle(
                                color: AppColors.WHITE_COLOR,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      );
                    }).toList();
                  },
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: const TextStyle(
                          color: AppColors.WHITE_COLOR,
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
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
                child: panes[items.indexOf(dropdownvalue)]))
      ],
    );
  }
}
