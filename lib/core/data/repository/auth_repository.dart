import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/data/models/common_response.dart';
import 'package:e_commerce/core/data/models/token_info.dart';
import 'package:e_commerce/core/enums/request_type.dart';
import 'package:e_commerce/core/utils/network_util.dart';

class AuthRepository {
  Future<Either<String, TokenInfo>> login({
    required String username,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          route: 'auth/login',
          type: RequestType.POST,
          body: {
            "username": username,
            "password": password,
          }).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return left(commonResponse.message);
        }
      });
    } catch (e) {
      return left(e.toString());
    }
  }
}
