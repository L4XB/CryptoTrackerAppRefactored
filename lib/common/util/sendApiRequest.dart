import 'package:dio/dio.dart';

class SendApiRequest {
  ///[data] -> Body data of API Request
  ///[url] -> URl of the API
  ///[returns] -> Response of API Request
  Future<Response> sendApiPOSTRequets(Object data, String url) async {
    return await Dio().post(url, data: data);
  }
}
