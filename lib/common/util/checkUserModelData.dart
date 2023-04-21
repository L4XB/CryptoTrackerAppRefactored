import 'package:foodapp/models/userModel.dart';
import '../errors/missingDataExeption/exeptionType.dart';
import '../errors/missingDataExeption/missingDataExeption.dart';

class CheckUserModelData {
  void checkUserModel(UserModel testcase) {
    if (testcase.mail!.isEmpty) {
      throw MissingDataExeption(MissingDataExeptionType.emailMissing);
    }
    if (testcase.name!.isEmpty) {
      throw MissingDataExeption(MissingDataExeptionType.nameMissing);
    }
    if (testcase.age!.isEmpty) {
      throw MissingDataExeption(MissingDataExeptionType.ageMissing);
    }
    if (testcase.password!.isEmpty) {
      throw MissingDataExeption(MissingDataExeptionType.passwordMissing);
    }
  }
}
