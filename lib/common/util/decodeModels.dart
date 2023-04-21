import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodapp/models/userModel.dart';
import '../errors/runtimeExeption/runtimeExeption.dart';
import '../errors/runtimeExeption/runtimeExeptionType.dart';
import 'decodeApiData.dart';

class DecodeModel {
  ///Decode User Model
  ///[response] -> Response from Api Request
  ///[returns] -> User Model with parsed Data
  ///[onError] -> Throw Runntime Exeption
  UserModel decodeUserModel(Response response) {
    //Decode Data
    var body = DecodeApiData().decodeApiDataAtPlace("user", response);
    var decodetBody = jsonDecode(response.toString());

    //Creta user Model
    UserModel user = UserModel();

    //Parse Data to Model
    try {
      user.age = body["age"];
      user.mail = body["email"];
      user.name = body["name"];
      user.avatarURL =
          "${"http://h2980175.stratoserver.net/users/" + body["_id"]}/avatar";
      user.sessioToken = decodetBody["token"];
    } catch (e) {
      throw RuntimeExeption(RunTimeExeptionType.CantParseData);
    }

    //return Model
    return user;
  }
}
