import 'dart:io';

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

  Future<LoadUserResponse?> loadUsers() async {
    Future.delayed(const Duration(seconds: 2), () {});
    LoadUserResponse? loadUserResponse;
    var url = baseUrl + getUserUrl;
    var dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer $token"}));
      if (response.statusCode == 200) {
        // debugPrint(response.data.toString());
        loadUserResponse = LoadUserResponse.fromJson(response.data);
      } else {
        debugPrint("nah");
        // loadUserResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }

    debugPrint(loadUserResponse.toString());
    return loadUserResponse;
  }
}
