import 'dart:convert';

import 'package:http/http.dart' as http;
// INTERNAL
import 'package:rca/api/constants.dart';
import 'package:rca/models/user.dart';

class AuthService {
  Future<http.Response> signIn(UserSignIn user) async {
    String _body = json.encode(user.value());
    String url = '$BASE_URL/auth/user/jwt';

    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: _body,
    );

    if (response.statusCode >= 400) {
      var body = json.decode(response.body);
      throw Exception(body);
    }

    return response;
  }

  Future<http.Response> checkToken(String accessToken) async {
    String url = '$BASE_URL/auth/user/jwt/check';

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

  dispose() {}
}
