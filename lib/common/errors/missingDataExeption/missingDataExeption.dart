import 'exeptionType.dart';

class MissingDataExeption implements Exception {
  final MissingDataExeptionType type;

  MissingDataExeption(this.type);

  @override
  String toString() {
    return 'ConnectionExeption: $type';
  }
}
