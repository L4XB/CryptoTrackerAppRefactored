import 'package:flutter/material.dart';

//This is by deafult Android Layout because is used when Platform is not supported

class ErrorPageView extends StatefulWidget {
  const ErrorPageView({super.key});

  @override
  State<ErrorPageView> createState() => _ErrorPageViewState();
}

class _ErrorPageViewState extends State<ErrorPageView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}