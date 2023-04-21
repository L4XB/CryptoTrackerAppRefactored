import 'package:flutter/material.dart';
import 'package:foodapp/common/constants/style_constants.dart';

class LoginAndroid extends StatefulWidget {
  const LoginAndroid({super.key});

  @override
  State<LoginAndroid> createState() => _LoginAndroidState();
}

class _LoginAndroidState extends State<LoginAndroid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}

///[context] -> Build Context of Mother_widget
///[returns] -> Body of Page as Widget
Widget _buildBody(BuildContext context) {
  return Column(
    children: [],
  );
}
