import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter_codigo4_login/helpers/sp_global.dart';
import 'package:flutter_codigo4_login/helpers/utils.dart';
import 'package:flutter_codigo4_login/models/user_model.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class APIService {
  Logger logger = Logger();
  final SPGlobal _prefs = SPGlobal();

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
        // pdoemos usar cualqueira de los 2 body
        /*body: json.encode(
          {
            "username": user.username,
            "password": user.password,
          },
        ),*/
        body: json.encode(user.toJson()),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> myMap = json.decode(response.body);
        User user = User.fromJson(myMap["user"]);
        user.token = myMap["access"];
        _prefs.token = myMap["access"];
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

  Future<User?> register(User user) async {
    try {
      String _path = pathProduction + "/registro/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.post(
        _uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        /*body: json.encode({
          "dni": "47707729",
          "password": "3volution",
          "nombreCompleto": "Felipe Montes",
          "telefono": "969461011",
          "direccion": "Av. Tapia 232"
        }),*/
        body: json.encode(user.toJson()),
      );
      //logger.e(response.statusCode);
      //logger.w(response.body);
      if(response.statusCode == 201){
        String source = Utf8Decoder().convert(response.bodyBytes);
        Map<String, dynamic> myMap = json.decode(source);
        User user = User.fromJson(myMap);
        _prefs.token = user.token!;
        return user;
      }else if(response.statusCode == 400){
        Map<String, dynamic> myMap = json.decode(response.body);
        List resPhone = myMap["telefono"] ?? [];
        List resDni = myMap["dni"] ?? [];

        User user = User(
          dni: resDni.isNotEmpty ? resDni.first : "",
          telefono: resPhone.isNotEmpty ? resPhone.first : "",
        );
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

  Future<User?> getUser()async{
    try{
      String _path = pathProduction + "/user/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(
        _uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Jwt "+_prefs.token,
        },
      );
      if(response.statusCode == 200){
        String source = Utf8Decoder().convert(response.bodyBytes);
        Map<String, dynamic> myMap = json.decode(source);
        User user = User.fromJson(myMap);
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
