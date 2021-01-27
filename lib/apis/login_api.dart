import 'dart:convert';

import 'package:mesa_news_app/utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:mesa_news_app/constants/globals.dart' as globals;


class LoginApi {

  static Future<ApiResponse<String>> login(String login, String password) async {

    try {
      String prefUrl =  globals.strWebService;
      String endpoint =  '/v1/client/auth/signin';

      var url = '$prefUrl$endpoint';
      Map<String,String> headers = {"Content-Type" : "application/json"};

      final params = {"email": login, "password": password};

      String body = json.encode(params);

      final response = await http.post(url, body: body, headers: headers);

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final token = mapResponse["token"];
        return ApiResponse.ok(token);
      }

      return ApiResponse.error(mapResponse["message"]);
    }catch(error){
      return ApiResponse.error("Não foi possivel realizar o login erro inesperado");
    }
  }
}
