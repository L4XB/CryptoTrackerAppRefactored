import 'package:foodapp/common/errors/runtimeExeption/runtimeExeptionType.dart';

class RuntimeExeption implements Exception {
  final RunTimeExeptionType type;

  RuntimeExeption(this.type);

  @override
  String toString() {
    return 'ConnectionExeption: $type';
  }
}
