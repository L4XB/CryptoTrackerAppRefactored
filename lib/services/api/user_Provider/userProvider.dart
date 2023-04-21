import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:foodapp/common/errors/connectionExeption/connectionExeption.dart';
import 'package:foodapp/common/errors/connectionExeption/exeptionType.dart';
import 'package:foodapp/common/errors/runtimeExeption/runtimeExeption.dart';
import 'package:foodapp/common/errors/runtimeExeption/runtimeExeptionType.dart';
import 'package:foodapp/common/util/checkUserModelData.dart';
import 'package:foodapp/common/util/decodeApiData.dart';
import 'package:foodapp/common/util/decodeModels.dart';
import 'package:foodapp/common/util/handelingStatusCodes.dart';
import 'package:foodapp/common/util/sendApiRequest.dart';
import 'package:foodapp/config/apiConfig/apiConfig.dart';
import 'package:foodapp/models/userModel.dart';

class UserProvider {
  ///Create User
  ///[user] -> User Model with data
  void createUser(UserModel user) async {
    //Test if Data is filled out
    CheckUserModelData().checkUserModel(user);

    //Response
    late Response response;

    //Data
    Object? userModelData = {
      "name": user.name,
      "age": user.age,
      "email": user.mail,
      "password": user.password
    };

    //Request
    try {
      response = SendApiRequest()
          .sendApiPOSTRequets(userModelData, ApiConfig().baseURL) as Response;
    } catch (e) {
      //Throw Expetion if requenst can not send
      throw ConnectionExeption(ConnectionExeptionType.serverIssues);
    }
    //Handel StatusCodes
    HandelingStatusCodes().handelStatusCode(response.statusCode)
        ? print("User succesfullly created")
        : throw ConnectionExeption(ConnectionExeptionType.noInternetConnection);
  }

  ///Login
  ///[password] -> Passwor of User Account
  ///[mail] -> Mail of user Account
  Future<UserModel?> userLogin(String password, String mail) async {
    //Response
    Response response;

    //Data
    Object? userLoginData = {"email": mail, "password": password};

    //Request
    try {
      response = SendApiRequest().sendApiPOSTRequets(
          userLoginData, "${ApiConfig().baseURL}login") as Response;
    } catch (e) {
      //Throw Expetion if requenst can not send
      throw ConnectionExeption(ConnectionExeptionType.serverIssues);
    }

    //Handel StatusCode
    if (HandelingStatusCodes().handelStatusCode(response.statusCode)) {
      //Decode user Model
      UserModel user = DecodeModel().decodeUserModel(response);

      return user;
    } else {
      throw ConnectionExeption(ConnectionExeptionType.noInternetConnection);
    }
  }
}
