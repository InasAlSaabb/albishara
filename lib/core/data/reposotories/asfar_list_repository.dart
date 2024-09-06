import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/list_asfar_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/list_asfar_endpoints.dart';

import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class AsfarRepository {
  Future<Either<String, List<asfarListModel>>> getAll(
      {required String id}) async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: AsfarEndpoints.getasfarList + id,
        headers:
            NetworkConfig.getHeaders(needAuth: false, type: RequestType.GET),
      );

      CommonResponse<List<dynamic>> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<asfarListModel> result = [];

        commonResponse.data!.forEach(
          (element) {
            result.add(asfarListModel.fromJson(element));
          },
        );
        return Right(result);
      } else {
        return Left(commonResponse.message ?? '');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
