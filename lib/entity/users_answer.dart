import 'package:flutterstaj/entity/users.dart';

class UsersAnswer {
  List<Users>? users;
  int? success;

  UsersAnswer({this.users, this.success});

  UsersAnswer.fromJson(Map<String, dynamic> json) {
    if (json['kisiler'] != null) {
      users = <Users>[];
      json['kisiler'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    success = json['success'];
  }
}