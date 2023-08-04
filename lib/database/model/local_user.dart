
const String tableNameUsers = "users";

class LocalUsersTableFields{

  static final List<String> values = [
    id,email,phone
  ];

  static const String id = "id";
  static const String email = "mail";
  static const String phone = "phone";
}

class LocalUsers{

  final int ?id;
  final String ?email;
  final int ?phone;

  const LocalUsers({this.id, this.email, this.phone});

  LocalUsers copy({int ?id,String?email, int? phone}){

    return LocalUsers(
        id: id ?? this.id,
        email: email ?? this.email,
        phone: phone ?? this.phone
    );
  }

  Map<String, Object?> toJson() =>{

    LocalUsersTableFields.id : id,
    LocalUsersTableFields.email : email,
    LocalUsersTableFields.phone: phone
  };

  static LocalUsers fromJson(Map<String, Object?> json) => LocalUsers(

      id: json[LocalUsersTableFields.id] as int?,
      email: json[LocalUsersTableFields.email] as String,
      phone: json[LocalUsersTableFields.phone] as int
  );
}
