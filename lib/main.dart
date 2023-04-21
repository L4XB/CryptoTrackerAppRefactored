import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/common/middleware/platform_switch.dart';
import 'package:foodapp/views/login_view/login.dart';
import 'dart:io' show Platform;

//  Created by Lukas Buck

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //Get Platformbased Design
    return PlatformSwitch().getRightPlatformBasedWidget(const Login());
  }
}
