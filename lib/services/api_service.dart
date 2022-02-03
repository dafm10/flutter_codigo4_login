import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter_codigo4_login/helpers/utils.dart';
import 'package:flutter_codigo4_login/models/user_model.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class APIService {
  Logger logger = Logger();

  Future<User?> login(User user) async {
    try {
      String _path = pathProduction + "/login/";
      Uri _uri = Uri.parse(_path);
      print(user.toJson());
      http.Response response = await http.post(
        _uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        /*body: json.encode(
          {
            "username": user.username,
            "password": user.password,
          },
        ),*/
        // pdoemos usar cualqueira de los 2 body
        body: json.encode(user.toJson()),
      );
      if(response.statusCode == 200){
        Map<String, dynamic> myMap = json.decode(response.body);
        User user = User.fromJson(myMap["user"]);
        return user;
      }

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
