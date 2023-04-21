import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginIOS extends StatefulWidget {
  const LoginIOS({super.key});

  @override
  State<LoginIOS> createState() => _LoginIOSState();
}

class _LoginIOSState extends State<LoginIOS> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildBody(context),
    );
  }
}

///[context] -> Build Context of Mother_widget
///[returns] -> Body of Page as Widget
Widget _buildBody(BuildContext context) {
  return Column(
    children: const [],
  );
}
