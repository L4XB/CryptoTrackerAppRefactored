import 'package:dio/dio.dart';
import 'package:foodapp/common/errors/connectionExeption/connectionExeption.dart';
import 'package:foodapp/common/errors/connectionExeption/exeptionType.dart';
import 'package:foodapp/common/util/checkUserModelData.dart';
import 'package:foodapp/common/util/handelingStatusCodes.dart';
import 'package:foodapp/common/util/sendApiRequest.dart';
import 'package:foodapp/config/apiConfig/apiConfig.dart';
import 'package:foodapp/models/userModel.dart';

class UserProvider {
  //Create User
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
}
