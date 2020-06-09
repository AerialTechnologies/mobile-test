import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rca/api/constants.dart';
// INTERNAL
import 'package:rca/api/service_auth.dart';
import 'package:rca/models/user.dart';

class Auth {
  static final Auth _instance = Auth._internal();
  FlutterSecureStorage storage = new FlutterSecureStorage();
  String accessToken;
  String user;

  factory Auth() => _instance;
  Auth._internal();

  Future<bool> checkToken() async {
    bool _isValid = false;

    String token = await storage.read(key: "accessToken");
    if (token == null) return _isValid;

    try {
      http.Response tokenResponse = await AuthService().checkToken(token);
      if (tokenResponse.statusCode == 304) {
        accessToken = token;
        _isValid = true;
      }

      if (tokenResponse.statusCode == 200) {
        accessToken = json.decode(tokenResponse.body)["accessToken"];
        _isValid = true;
      }

      return _isValid;
    } catch (e) {
      await storage.deleteAll();
      return _isValid;
    }
  }

  Future<bool> signIn(UserSignIn _user) async {
    user = _user.email;

    try {
      http.Response userResponse = await AuthService().signIn(_user);
      accessToken = json.decode(userResponse.body)["accessToken"];
      await storage.write(key: "accessToken", value: accessToken);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<http.Response> getStatus() async {
    String url =
        '$BASE_URL/group/f0ba8cf5-425a-450d-889d-bab19a9a625e/activity/isActive';

    http.Response response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $accessToken'
      },
    );

    if (response.statusCode >= 400) {
      var body = json.decode(response.body);
      print("Responses Status: $body");
      throw Exception(body);
    }

    return response;
  }
}
