import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaj/database/model/local_user.dart';

import '../database/dao.dart';

class MyProfileCubit extends Cubit<List<LocalUsers>>{

  MyProfileCubit():super(<LocalUsers>[]);

  final _repo = DB.instance;

  var incomingUser = <LocalUsers> [];
  Future<void> uploadUser({@required String? email}) async{
    var userInfo = await _repo.getUserInfo(email!);
    if(incomingUser.isEmpty){
      if(userInfo != null) {
        incomingUser = userInfo;
      }
    }else{
      incomingUser.clear();
      if(userInfo != null) {
        incomingUser = userInfo;
      }
    }
    emit(incomingUser);
  }

  Future<void> insertUser({@required LocalUsers? person}) async{
     await _repo.insertUser(person!);
  }
}