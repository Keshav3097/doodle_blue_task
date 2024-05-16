
import 'package:doodle_blur_task/app/core/http_helper/models/request_model.dart';
import 'package:doodle_blur_task/app/features/business/data/models/business_response_model.dart';
import 'package:doodle_blur_task/app/features/business/domain/entity/business_entity.dart';
import 'package:http/http.dart' as http;
abstract class BusinessDataSource {
  Future<RequestStatus<BusinessEntity>> getBusiness();
}

class BusinessDataSourceImpl extends BusinessDataSource {

  BusinessDataSourceImpl();

  @override
  Future<RequestStatus<BusinessEntity>> getBusiness() async {
    try {
      final Map<String, String> header = {
        "Content-type": "application/json",
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        "Authorization": 'Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx',
      };

      final response = await  http.get(Uri.parse("https://api.yelp.com/v3/businesses/search?location=NYC"),
        headers: header
      );
      print("response: ${response.statusCode}");
      if (response.statusCode == 200) {
        final res = businessResponseModelFromJson(response.body);
        return RequestStatus<BusinessEntity>(
          RequestStatus.SUCCESS,
          null,
          res.toEntity(),
        );
      } else {
        return RequestStatus<BusinessEntity>(
          RequestStatus.FAILURE,
          "Api Call failed",
          null,
        );
      }
    } catch (e) {

      return RequestStatus<BusinessEntity>(
        RequestStatus.FAILURE,
        "Error (Data Source) : $e",
        null,
      );
    }
  }
}