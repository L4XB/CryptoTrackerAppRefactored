import 'package:foodapp/common/errors/connectionExeption/exeptionType.dart';

class ConnectionExeption implements Exception {
  final ConnectionExeptionType type;

  ConnectionExeption(this.type);

  @override
  String toString() {
    return 'ConnectionExeption: $type';
  }
}
