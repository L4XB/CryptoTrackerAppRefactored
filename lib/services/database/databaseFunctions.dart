import 'package:foodapp/services/database/databaseProvider.dart';

class DatabaseFunctions {
  ///Get Status of current App User
  ///[returns] -> false if Data is emty and true if data is not
  Future<bool> getStatusOfCurrentUser() async {
    var currenData = await UserDatabaseProvider().readDatabase();
    if (currenData.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
