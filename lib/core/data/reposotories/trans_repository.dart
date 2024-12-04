import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/ayat_model.dart';
import 'package:flutter_templete/core/data/models/apis/list_asfar_model.dart';
import 'package:flutter_templete/core/data/models/apis/sefer_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/ayat_endpoints.dart';
import 'package:flutter_templete/core/data/network/endpoints/list_asfar_endpoints.dart';
import 'package:flutter_templete/core/data/network/endpoints/trans_endpoints.dart';

import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class TransRepository {
  Future<Either<String, List<SefrModel>>> getAll({required String ch}) async {
    try {
      final response = await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: TranEndpoints.getAll + ch,
        headers:
            NetworkConfig.getHeaders(needAuth: false, type: RequestType.GET),
      );

      CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        List<SefrModel> result = [];

        commonResponse.data['asfar']!.forEach(
          (element) {
            result.add(SefrModel.fromJson(element));
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
