import 'dart:convert';

import 'package:dio/dio.dart';

class DecodeApiData {
  dynamic decodeApiDataAtPlace(String decodePlace, Response response) {
    var body = jsonDecode(response.toString())[decodePlace];
  }
}
