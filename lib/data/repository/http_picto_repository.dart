import 'dart:convert';

import 'package:picktock/domain/repository/abstract_picto.dart';
import 'package:picktock/styles/style.dart';
import 'package:picktock/data/models/newpicto.dart';
import 'package:picktock/domain/repository/abstract_auth.dart';
import 'package:http/http.dart' as http;

class HttpPictoRepository extends AbstractPicto {

  @override
  Future<bool> addpicto(NewPicto newPicto) async {
    try {
      String url = baseUri + "/api/auth/signup";
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          /*'Authorization': "Bearer $token",*/
        },
        body: jsonEncode({
          "pic_title": newPicto.pic_title,
          "pic_visibility": newPicto.pic_visibility,
          "pic_image": newPicto.pic_image,
          "cat_id": newPicto.cat_id
        }),
      );
      print(newPicto.pic_title);
      if (response.statusCode == 201) {
        dynamic jsonData = jsonDecode(response.body);
        jsonData = jsonData['message'];
        print(jsonData);
        return true;
      } else if (response.statusCode == 422) {
        dynamic jsonData = jsonDecode(response.body);
        print(jsonData);
        print("Error en Validaciones");
        return false;
      } else {
        dynamic jsonData = jsonDecode(response.body);
        print(jsonData);
        print("Error no encontrado");
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}