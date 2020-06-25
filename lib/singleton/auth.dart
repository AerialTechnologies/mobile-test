import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// INTERNAL
import 'package:rca/api/service_auth.dart';
import 'package:rca/api/group_status.dart';
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

  Future<bool> groupStatus() async {
    checkToken();

    try {
      http.Response groupResponse =
          await FetchHomeGroup().fetchHome(accessToken: accessToken);
      print(groupResponse);
      if (groupResponse.statusCode >= 400) {
        return false;
      }
      return true;
    } catch (e) {
      print('deu ruim');
      return false;
    }
  }
}
