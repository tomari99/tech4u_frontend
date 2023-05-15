import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tech4u/components/utils.dart';

void httpErrorHandle(
    {required Response res,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(res.data)['message']);
      break;
    case 509:
      showSnackBar(context, jsonDecode(res.data)['message']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(res.data)['message']);
      break;
    default:
      showSnackBar(context, res.data);
      break;
  }
}
