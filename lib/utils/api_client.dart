import 'package:dio/dio.dart';

class ApiClient {
  final dio = Dio();
  String baseUrl = "https://suncity.warmonks.com/api/";
  Future<Response> loginRequest({required username, required password}) {
    return dio.post("${baseUrl}login", data: {
      "username": username,
      "password": password,
      "token":
          "cGTk0CXeR767zr5VuUe4Pa:APA91bEme2KwmSlsfzyDvT1dz1YJcBSNofzpyuRuWhrQ-9X_wlgnWrRedH9GcUvggANbzVZ_38wrPDGejl-ujo5Wwgx8PQupb0_LPnlsjDIrxYZIeLlL7iwncqgPNwjBXMwi0MQ2ytji"
    });
  }

  Future<Response> getCategory() {
    return dio.get(
      "${baseUrl}category",
    );
  }

  Future<Response> getProduct({required int id}) {
    return dio.post(
      "${baseUrl}prdtcat?id=${id}",
    );
  }

  Future<Response> getBrand({required int id}) {
    return dio.post("${baseUrl}brdcat?id=47");
  }
}
