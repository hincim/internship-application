import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterstaj/entity/users_answer.dart';
import 'package:flutterstaj/utils/constants.dart';

import '../entity/users.dart';

class UsersDao{

  List<Users>? parseUsersAnswer(String answer){

    return UsersAnswer.fromJson(json.decode(answer)).users;

  }

  Future<List<Users>?> getAllUsers() async {

    var answer = await Dio().get(Constants.url);
    return parseUsersAnswer(answer.data.toString());
  }
}