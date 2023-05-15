import 'package:dio/dio.dart';
import 'package:tech4u/api/models/api_model.dart';

class ApiCall {
  final String? id;
  final String baseUrl;
  late ApiModel api;
  String? route;

  ApiCall({required this.baseUrl, this.id, this.route}) {
    api = ApiModel(baseUrl: baseUrl, id: id, route: route);
  }

  Future<dynamic> fetchData() async {
    try {
      final response = await api.fetchApi();

      return response.data;
    } catch (e) {
      throw FormatException('Error fetching data: $e');
    }
  }

  Future<Response<dynamic>> postData(
      {FormData? formData, Map<String, String>? map}) async {
    try {
      if (map != null) {
        final res = await api.postApi(
          map: map,
        );
        return res;
      }
      final res = await api.postApi(
        formData: formData,
      );

      return res;
    } catch (e) {
      throw FormatException('Error posting data: $e');
    }
  }
}
