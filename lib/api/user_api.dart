import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_management/api/http_services.dart';
import 'package:portfolio_management/response/load_user_response.dart';
import 'package:portfolio_management/response/login_response.dart';
import 'package:portfolio_management/utils/url.dart';

import '../models/user.dart';

class UserApi {
  Future<bool> register(User user) async {
    bool isSignup = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isSignup;
  }

  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();

      var response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        isLogin = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<LoadUserResponse?> loadUser() async {
    Future.delayed(const Duration(seconds: 2), () {});
    LoadUserResponse? loadUserResponse;
    try {
      var dio = HttpServices().getDioInstance();
      var url = baseUrl + getUserUrl;

      Response response = await dio.get(url);
      if (response.statusCode == 201) {
        loadUserResponse = LoadUserResponse.fromJson(response.data);
      } else {
        loadUserResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return loadUserResponse;
  }
}
