import 'package:foodapp/common/errors/webSocketServerExeption/webSocketExeptionType.dart';

class WebSocketExeption implements Exception {
  final WebSocketExeptionType type;

  WebSocketExeption(this.type);

  @override
  String toString() {
    return 'ConnectionExeption: $type';
  }
}
