import 'package:foodapp/common/errors/statusCodes/exeptionType.dart';
import 'package:foodapp/common/errors/statusCodes/statusCode.dart';

class HandelingStatusCodes {
  ///[statusCode] -> current status Code of the Request
  ///[returns] -> true is request was succesfully and false if not
  bool handelStatusCode(int? statusCode) {
    if (statusCode == 400) {
      throw StatusCode(StatusCodeType.BadRequest);
    }
    if (statusCode == 401) {
      throw StatusCode(StatusCodeType.Unauthorized);
    }
    if (statusCode == 403) {
      throw StatusCode(StatusCodeType.Forbidden);
    }
    if (statusCode == 404) {
      throw StatusCode(StatusCodeType.NotFound);
    }
    if (statusCode == 405) {
      throw StatusCode(StatusCodeType.NotAllowed);
    }
    if (statusCode == 408) {
      throw StatusCode(StatusCodeType.Timeout);
    }

    if (statusCode == 201 || statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
