import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaj/entity/users.dart';
import 'package:flutterstaj/repo/users_dao.dart';

class HomePageCubit extends Cubit<List<Users>>{

  HomePageCubit():super(<Users>[]);

  final _repo = UsersDao();

  Future<void> uploadContacts() async {

    var list = await _repo.getAllUsers();
    emit(list!);
  }
}