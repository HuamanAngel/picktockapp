import 'dart:convert';

import 'package:picktock/styles/style.dart';
import 'package:picktock/data/models/pictograma.dart';
import 'package:picktock/domain/repository/abstract_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PictoRepository {
  Future<SharedPreferences> preferencias = SharedPreferences.getInstance();
  String? token;
  List<Picto> pictos = [];
  @override
  Future<List<Picto>> getPictos() async {
    final SharedPreferences pref2 = await preferencias;
    token = (pref2.getString("token") ?? 's');
    bool auth = (pref2.getBool("auth") ?? false);
    String url = " ";
    if (auth) {
      url =
          "http://picktock.alwaysdata.net/picktock-backend/public/api/auth/pictograma";
    } else {
      url =
          "http://picktock.alwaysdata.net/picktock-backend/public/api/pictograma/public";
    }
    try {
      String url = baseUri + "/api/auth/signup";
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          /*'Authorization': "Bearer $token",*/
        },
      );
      Map valor = jsonDecode(response.body);
      if (response.statusCode == 201) {
      } else if (response.statusCode == 422) {
      } else if (response.statusCode == 401) {
      } else {}
      dynamic jsonData = ""; // as List;
      jsonData = jsonDecode(response.body);
      jsonData = jsonData['data'];
      int tam = jsonData.length;
      for (var i = 0; i < tam; i++) {
        pictos.add(Picto(
          imagenURL: jsonData[i]["pic_url_image"],
          titulo: jsonData[i]["pic_title"],
          id: i,
          creacion: jsonData[i]["created_at"],
          catId: jsonData[i]["cat_id"],
          picVisibility: jsonData[i]["pic_visibility"]          
        ));
      }
      return pictos;
    } catch (e) {
      throw Exception(e);
    }
  }
}
