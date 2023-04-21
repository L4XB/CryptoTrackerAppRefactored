import 'package:flutter/material.dart';
import 'package:foodapp/views/login_view/platform_views/login_android.dart';
import 'package:foodapp/views/login_view/platform_views/login_ios.dart';
import 'dart:io' show Platform;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? _buildAndroidLayout() : _buildIOSLayout();
  }
}

///[returns] -> Android Login-Page Layout
Widget _buildAndroidLayout() {
  return const LoginAndroid();
}

///[returns] -> IOS Login-Page Layout
Widget _buildIOSLayout() {
  return const LoginIOS();
}
