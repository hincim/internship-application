
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';


part 'whole_model.g.dart';

class WholeModel = WholeModelBase with _$WholeModel;

abstract class WholeModelBase with Store{

  @observable
  int tabsIndex = 0;

  @observable
  bool refreshState = false;

  @observable
  bool iconState = true;

  @observable
  int initialValue = 2;

  @observable
  bool langOptionState = false;

  @observable
  bool registerPagePsw = true;

  @observable
  bool registerPagePswAgain = true;

  @observable
  bool checkBoxOne = false;

  @observable
  bool checkBoxTwo = false;

  @observable
  String version = "";

  @observable
  bool appBarControl = false;

  @observable
  String city = "";


  @action
  void appBarControlled(){
    appBarControl = !appBarControl;
  }

  @action
  void searchWord(String city){
    this.city = city;
  }

  @action
   void handleTabChange(TabController tabController) {
    tabsIndex = tabController.index;
    appBarControl = false;
  }

  void packageInfoInit() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
  }

  @action
  void iconStateChanged(){
    iconState = !iconState;
  }

  @action
  void langOption(bool? value){
    if(value!){
      langOptionState = true;
    }else{
      langOptionState = false;
    }
  }

  @action
  void refresh(bool? value){
    if(value!){
      refreshState = true;
    }else{
      refreshState = false;
    }
  }

  @action
  void initialValueChanged(int value){
    initialValue = value;
  }

  @action
  void registerPagePswChanged(int i){
    if(i==1){
      registerPagePsw = !registerPagePsw;
    }else{
      registerPagePswAgain = !registerPagePswAgain;
    }
  }

  @action
  void checkBoxChanged(int i){
    if(i==1){
      checkBoxOne = !checkBoxOne;
    }else{
      checkBoxTwo = !checkBoxTwo;
    }
  }


}