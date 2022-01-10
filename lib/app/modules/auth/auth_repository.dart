import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/exception/exceptions.dart';
import 'package:taskf/app/core/models/user.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository(this.dio);

  dynamic loginRequest({
    required String name,
    required String pass,
  }) async {
    try {
      Map data = {Keys.userNameKey: name, Keys.userPasswordKey: pass};
      var body = json.encode(data);
      Response? rs;
      rs = await dio.post(
        '/user_login',
        data: body,
      );
      return rs;
    } on DioError catch (e) {
      return e;
    }
  }

  fromJson(Map<String, dynamic> json) => User(
        name: json[Keys.userNameKey],
        fullName: json[Keys.userFullNameKey],
        password: json[Keys.userPasswordKey],
        number: json[Keys.userNumberKey],
        city: json[Keys.userCityKey],
      );
/////////////////////////////////////////////////////////////////
  Future<User> loginRequestt(
      {required String name, required String pass, context}) async {
    Map data = {Keys.userNameKey: name, Keys.userPasswordKey: pass};
    // var body = json.encode(data);
    Response response;
    try {
      response = await dio.post(
        '/user_login',
        data: data,
      );
      User user;
      Map<String, dynamic> userMap = Map<String, dynamic>.from(response.data);
      user = fromJson(userMap);
      return user;
    } on DioError catch (e) {
      String errorMessage = MyDioError.returnErrorType(e);
      ShowErrorMessage.showErrMSG(errorMessage, context);
      rethrow;
    }
  }

  Future<User> signUpRequestt(String name, String pass, String fullName,
      String number, String city, context) async {
    Map<String, dynamic> dataMap = {
      Keys.userNameKey: name,
      Keys.userPasswordKey: pass,
      Keys.userFullNameKey: fullName,
      Keys.userNumberKey: number,
      Keys.userCityKey: city,
    }; // var body = json.encode(data);
    Response response;
    try {
      response = await dio.post('/user_register', data: dataMap);
      User user = User(
        name: name,
        fullName: fullName,
        password: pass,
        number: number,
        city: city,
      );
      return user;
    } on DioError catch (e) {
      String errorMessage = MyDioError.returnErrorType(e);
      ShowErrorMessage.showErrMSG(errorMessage, context);
      rethrow;
    }
  }
}
