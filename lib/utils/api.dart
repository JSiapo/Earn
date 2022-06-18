import 'package:dio/dio.dart';

const url = 'https://finance.backend.jsiapo.dev/api';

class API {
  Dio api = Dio(
    BaseOptions(
      baseUrl: url,
      connectTimeout: 20000,
      receiveTimeout: 20000,
    ),
  );

  Future<dynamic> getData<T>(String endpoint, {String? token}) async {
    try {
      final header = <String, dynamic>{};
      if (token != null) header['Authorization'] = 'Bearer $token';
      final response = await api.get<T>(
        endpoint,
        cancelToken: CancelToken(),
        options: Options(
          receiveDataWhenStatusError: true,
          followRedirects: false,
          contentType: 'Application/json',
          method: 'GET',
          responseType: ResponseType.json,
          validateStatus: (status) {
            return status == 200;
          },
          headers: header,
        ),
      );
      return response.data;
    } on DioError catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  Future<Map<String, dynamic>> postFetch(
    String endpoint,
    dynamic body, {
    String? token,
  }) async {
    try {
      final header = <String, dynamic>{};
      if (token != null) header['Authorization'] = 'Bearer $token';
      final response = await api.post<Map<String, dynamic>>(
        endpoint,
        data: body,
        cancelToken: CancelToken(),
        options: Options(
          receiveDataWhenStatusError: true,
          followRedirects: false,
          contentType: 'Application/json',
          method: 'POST',
          responseType: ResponseType.json,
          validateStatus: (status) {
            return status == 200 || status == 201;
          },
          headers: header,
        ),
      );
      return response.data!;
    } on DioError {
      rethrow;
    }
  }
}
