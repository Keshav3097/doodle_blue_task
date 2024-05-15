import 'dart:convert';
import 'dart:io';
import 'package:doodle_blur_task/http_helper/models/request_model.dart';
import 'package:doodle_blur_task/model/business_response_model.dart';
import 'package:doodle_blur_task/model/services/base_service.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

import '../apis/app_exception.dart';

class BusinessService extends BaseService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(mediaBaseUrl + url));
      if (response.statusCode == 200) {
        final res = businessResponseModelFromJson(response.body);
        return RequestStatus<List<BusinessResponseModel>>(
          RequestStatus.SUCCESS,
          null,
          res,
        );
      } else {
        return RequestStatus<List<BusinessResponseModel>>(
          RequestStatus.FAILURE,
          "${response.statusCode} : ${response.body}",
          null,
        );
      }
    } on SocketException {
      return RequestStatus<List<BusinessResponseModel>>(
        RequestStatus.FAILURE,
        "Something Went Wrong",
        null,
      );
    }

  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
