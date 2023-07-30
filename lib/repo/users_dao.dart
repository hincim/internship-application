import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterstaj/entity/users_answer.dart';

import '../entity/users.dart';

class UsersDao{

  List<Users>? parseUsersAnswer(String answer){

    return UsersAnswer.fromJson(json.decode(answer)).users;

  }

  Future<List<Users>?> getAllUsers() async {

    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var answer = await Dio().get(url);
    return parseUsersAnswer(answer.data.toString());
  }
}