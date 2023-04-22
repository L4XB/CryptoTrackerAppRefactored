import 'package:foodapp/common/errors/databaseExeption/databaseExeptionType.dart';

class DatabaseExeption implements Exception {
  final DatabaseExeptionType type;

  DatabaseExeption(this.type);

  @override
  String toString() {
    return 'ConnectionExeption: $type';
  }
}
