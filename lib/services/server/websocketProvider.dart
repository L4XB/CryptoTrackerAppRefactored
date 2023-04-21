import 'package:foodapp/common/errors/webSocketServerExeption/webSocketExeptionType.dart';
import 'package:foodapp/common/errors/webSocketServerExeption/webSocketServerExeption.dart';
import 'package:foodapp/config/serverConfig/serverConfig.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketProvider {
  //Connect to Server
  void connectToWebSocketServer(WebSocketChannel channel) {
    try {
      channel = WebSocketChannel.connect(Uri.parse(ServerConfig().baseURL));
    } catch (e) {
      throw WebSocketExeption(WebSocketExeptionType.serverIssues);
    }
  }

  //Colse connection to Server
  void closeConnectionToServer(WebSocketChannel channel) {
    try {
      channel.sink.close();
    } catch (e) {
      throw WebSocketExeption(WebSocketExeptionType.serverIssues);
    }
  }

  //Send Message to Server
  void sendMessageToServer(WebSocketChannel channel, String message) {
    try {
      channel.sink.add(message);
    } catch (e) {
      throw WebSocketExeption(WebSocketExeptionType.cantSendMessage);
    }
  }
}
