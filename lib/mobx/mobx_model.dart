import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'mobx_model.g.dart';

class MobxModel = MobxModelBase with _$MobxModel;

abstract class MobxModelBase with Store {

  @observable
  bool refresh = false;

  @observable
  String version = "";

  PackageInfo? packageInfo;


  @action
  void refreshTrue() {
    refresh = true;
  }

  @action
  void refreshFalse() {
    refresh = false;
  }

  @action
  void packageInfoInit() async {
    packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo!.version;
  }
}