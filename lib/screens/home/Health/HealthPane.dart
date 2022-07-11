import 'package:flutter/material.dart';

class HealthPane extends StatefulWidget {
  const HealthPane({Key? key}) : super(key: key);

  @override
  State<HealthPane> createState() => _HealthPaneState();
}

class _HealthPaneState extends State<HealthPane> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Health Pane"),
    );
  }
}
