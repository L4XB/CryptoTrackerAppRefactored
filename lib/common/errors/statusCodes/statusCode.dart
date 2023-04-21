import 'exeptionType.dart';

class StatusCode implements Exception {
  final StatusCodeType type;

  StatusCode(this.type);

  @override
  String toString() {
    return 'ConnectionExeption: $type';
  }
}
