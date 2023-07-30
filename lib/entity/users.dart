class Users {
  String? userId;
  String? userName;
  String? userTel;

  Users({this.userId, this.userName, this.userTel});

  Users.fromJson(Map<String, dynamic> json) {
    userId = json['kisi_id'];
    userName = json['kisi_ad'];
    userTel = json['kisi_tel'];
  }
}