class User {
  late int id;
  late String email;
  late dynamic token;
  late String name;
  late String lastname;
  late String createdAt;
  late int userNivelTea;
  User({
    required this.id,
    required this.email,
    required this.token,
    required this.name,
    required this.lastname,
    required this.createdAt,
    required this.userNivelTea,
  });

  User.nullable() {
    this.id = -1;
  }

  static User fromJson(Map<dynamic, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      token: json['token'],
      name: json['name'],
      lastname: json['lastname'],
      createdAt: json['created_at'],
      userNivelTea: json['user_nivel_tea'],
    );
  }
}
