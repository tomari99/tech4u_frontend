import "dart:convert";

import "package:dio/dio.dart";

class ApiModel {
  final dio = Dio();
  final String? id;
  final String baseUrl;
  final String? route;

  ApiModel({required this.baseUrl, this.id, this.route});

  Future<Response> fetchApi() async {
    if (route == null || route == '') {
      return throw Exception("need a route to fetch");
    }
    final apiEndpoint = baseUrl + (route ?? "") + (id != null ? "$id" : "");
    try {
      final res = await dio.get(apiEndpoint);
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postApi(
      {FormData? formData, Map<String, String>? map}) async {
    if (route == null || route == '') {
      return throw Exception("need a route to post");
    }
    final apiEndPoint = baseUrl + (route ?? '') + (id != null ? "$id" : "");

    try {
      if (map != null) {
        final res = await dio.post(apiEndPoint, data: jsonEncode(map));
        return res;
      }
      final res = await dio.post(
        apiEndPoint,
        data: formData,
      );

      return res;
    } catch (e) {
      throw Exception(e);
    }
  }
}
