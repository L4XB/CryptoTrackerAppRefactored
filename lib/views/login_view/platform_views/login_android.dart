import 'package:flutter/material.dart';
import 'package:foodapp/common/constants/style_constants.dart';
import 'package:foodapp/views/login_view/widgets/android/chaining_logo.dart';

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
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: _buildLoginViewforAndroid(context),
  );
}

///Build the Login Page
///[context] -> Build Context of Mother_widget
///[returns] -> Contet of Login Page view
Widget _buildLoginViewforAndroid(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      ChainingLogoAndroid(),
    ],
  );
}
