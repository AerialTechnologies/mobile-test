import 'dart:convert';

import 'package:http/http.dart' as http;
// INTERNAL
import 'package:rca/api/constants.dart';

class FetchHomeGroup {
  //
  Future<http.Response> fetchHome({String accessToken}) async {
    String _group_id = 'f0ba8cf5-425a-450d-889d-bab19a9a625e';
    String url = '$BASE_URL/group/${_group_id}/activity/isActive';

    http.Response response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $accessToken'
      },
    );

    if (response.statusCode >= 400) {
      var body = json.decode(response.body);
      throw Exception(body);
    }

    return response;
  }
}
