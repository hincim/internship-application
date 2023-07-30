import 'package:flutter_bloc/flutter_bloc.dart';

class MarkCubit extends Cubit<bool>{

  MarkCubit():super(false);

  bool mainMark = true;
  bool registerMark = true;
  bool registerMarkTwo = true;
  bool checked = false;
  bool checkedTwo = false;

  void marked(String id){

    if(id == "main_page"){
      mainMark = !state;
      emit(mainMark);
    }else if(id == "register_page_one"){
      registerMark = !state;
      emit(registerMark);
    }else{
      registerMarkTwo = !state;
      emit(registerMarkTwo);
    }

  }

  void checkedBox(String id){
    if(id == "check_box_one"){
      checked = !state;
      emit(checked);
    }else{
      checkedTwo = !state;
      emit(checkedTwo);
    }
  }
}