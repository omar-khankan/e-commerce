import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/data/models/common_response.dart';
import 'package:e_commerce/core/data/models/post_model.dart';
import 'package:e_commerce/core/enums/request_type.dart';
import 'package:e_commerce/core/utils/network_util.dart';

class PostRepository {
  Future<Either<String, List<PostModel>>> getPost() async {
    try {
      return NetworkUtil.sendRequest(
        route: 'posts',
        type: RequestType.GET,
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getStatus) {
          List<PostModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(PostModel.fromJson(element));
          });
          return Right(result);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
