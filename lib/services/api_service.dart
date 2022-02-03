import 'dart:async';
import 'dart:io';
import 'dart:convert';


import 'package:flutter_codigo4_login/helpers/utils.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class APIService {
  Logger logger = Logger();

  Future login() async {
    try {
      String _path = pathProduction + "/login/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.post(
        _uri,
        body: {
          "username": "44888982",
          "password" : "clave123",
        },
      );
      print("XXXXX ${response.statusCode}");
    } on TimeoutException catch (e) {
      logger.i(e);
      return Future.error("Error internet 1");
    } on SocketException catch (e) {
      logger.d(e);
      return Future.error("Error internet 2");
    } on Error catch (e) {
      logger.e(e);
      return Future.error("Error internet 3");
    }
  }
}
