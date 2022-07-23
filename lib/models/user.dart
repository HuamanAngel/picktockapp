import 'dart:convert';
import 'package:http/http.dart' as http;

class user {
  final String _url = "http://127.0.0.1:8000/api/auth/";
  Future<bool> registroUsuario(UserModel usuario) async {
    try {
      String url = '$_url/singup';
      final resp = await http.post(Uri.parse(url), body: json.encode(usuario));
      final decodedData = json.decode(resp.body);
      print(decodedData);
      print(url);
      if (resp.statusCode == 200) {
        print(resp.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return true;
  }
}

class UserModel {
  //final String id;
  final String name;
  final String lastname;
  final String email;
  final String password;
  final int user_nivel_tea;
  final int id;

  UserModel(this.id, this.name, this.lastname, this.email, this.password,
      this.user_nivel_tea);

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['lastname'],
        lastname = json['lastname'],
        email = json['email'],
        password = json['password'],
        user_nivel_tea = json['user_nivel_tea'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'user_nivel_tea': user_nivel_tea,
      };
}
