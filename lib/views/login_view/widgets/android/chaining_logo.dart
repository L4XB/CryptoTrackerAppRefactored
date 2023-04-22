import 'package:flutter/material.dart';

class ChainingLogoAndroid extends StatelessWidget {
  const ChainingLogoAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 110, 0, 0),
      child: Center(
        child: Text(
          "chaining.",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
