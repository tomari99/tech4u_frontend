import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tech4u/api/base_url.dart';

import 'package:tech4u/api/models/user_model.dart';
import 'package:tech4u/api/service/api_call.dart';
import 'package:tech4u/components/api_components/error_handling.dart';
import 'package:tech4u/components/utils.dart';

class AuthService {
  Future<Response<dynamic>> signUpUser(
      {required User user, required BuildContext context}) async {
    FormData formData = FormData();

    formData.fields.add(MapEntry('userName', user.userName));
    formData.fields.add(MapEntry('email', user.email));
    formData.fields.add(MapEntry('password', user.password));
    try {
      // Await for the response from postData()
      Response<dynamic> res = await ApiCall(baseUrl: baseUrl, route: "/signup")
          .postData(formData: formData);

      return res;
    } catch (e) {
      throw Exception("Sign Up Failed");
    }
  }

  Future<void> signInUser(
      {required String email, required String password}) async {
    try {
      final Map<String, String> map = {"email": email, "password": password};
      final res =
          await ApiCall(baseUrl: baseUrl, route: "/signin").postData(map: map);
      print(res.data);
      return res.data;
    } catch (e) {
      throw Exception("Sign in error : $e");
    }
  }
}



    // httpErrorHandle(
    //   res: res as Response,
    //   context: context,
    //   onSuccess: () =>
    //       showSnackBar(context, "Your account is created successfully"),
    // );