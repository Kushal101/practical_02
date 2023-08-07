import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:practical_task_02/utils/contant_url.dart';
import 'package:http/http.dart' as http;

import '../utils/contant_url.dart';

class AppService {
  final _dio = Dio(BaseOptions(baseUrl: Constants.apiBaseUrl));

  Future<dynamic> getAllUser() async {
    final response = await _dio.get(
      '?limit=20',
      options: Options(
        headers: {
          Constants.apiHeaderKey: Constants.apiHeaderValue,
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<dynamic> getUserDetails({required String userId}) async {
    final response = await _dio.get(
      '/$userId',
      options: Options(
        headers: {
          Constants.apiHeaderKey: Constants.apiHeaderValue,
        },
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<dynamic> updateUserDetails(
      {required String userId,
      required String firstName,
      required String lastName,
      required String picture,
      required String gender,
      required String email,
      required String DOB,
      required String phone,
      required String street,
      required String city,
      required String state,
      required String country,
      required String timeZone}) async {
    final response = await _dio.put(
      '/$userId',
      data: jsonEncode({
        "firstName": firstName,
        "lastName": lastName,
        "picture": picture,
        "gender": gender,
        "email": email,
        "dateOfBirth": DOB,
        "phone": phone,
        "location": {
          "street": street,
          "city": city,
          "state": state,
          "country": country,
          "timezone": timeZone
        }
      }),
      options: Options(
        headers: {
          Constants.apiHeaderKey: Constants.apiHeaderValue,
        },
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
