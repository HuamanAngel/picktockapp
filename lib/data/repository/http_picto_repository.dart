import 'dart:convert';

import 'package:picktock/domain/repository/abstract_picto.dart';
import 'package:picktock/styles/style.dart';
// import 'package:picktock/data/models/newpicto.dart';
import 'package:picktock/data/models/pictograma.dart';
import 'package:http/http.dart' as http;

class HttpPictoRepository extends AbstractPicto {

  @override
  Future<bool> addpicto(Picto newPicto) async {
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
          "pic_title": newPicto.titulo,
          "pic_visibility": newPicto.picVisibility,
          "pic_image": newPicto.imagenURL,
          "cat_id": newPicto.catId
        }),
      );
      // print(newPicto);
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

  @override
  Future<List<Picto>> getPictos() async {
    try{
      String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNGI4MWQ0MGRmM2QwNmEzY2JlYzEyOWY2MjUyZTI1YTUyNzBiYjNjNThmNzhiMTVkMjBkMGNjYTVlYWMzODY2OTRhZDJlNzdjZmJmNTAwMjYiLCJpYXQiOjE2NTg1ODg2OTguNzcwNTY1LCJuYmYiOjE2NTg1ODg2OTguNzcwNTY3LCJleHAiOjE2OTAxMjQ2OTguNjA4NjU1LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.o1MZy1IealJqBLy-0oF1J5AI4Qtb27A67eIfzO_av7LeY1k1Oo1fgtWcTgh6rFAKvJjRwxFZZS_X36-2cqCyGFILALv08CHAUJUDlqsjnkyJDG7ywccTmX-8GS5sWT3iJJZOEP6jK3Tk9pNWmgRtgAU17xfH8-hqevCFHd8rAb2JYgU48HxiOIjjTTlYbTj1X_B4c62NmfqWI0CbkhI1M_nS6Q5fAHKhXMVc0vyQY0BR1BVdFI5SQEx_FtWs-Md8PqBR5bc6m2Q0HY6yZHSi9SAiFbTV0x1aRusY2ZigGNsgK3EdzYhzakPCSpJsXqI8kGVMA9sDcwa-771qFDIgk87QHYq7y3sg-u6gfPRE6CvIZ8HMEbdXpgLea9RcD08Y6ywWlUDGBmFxydTxiJqFiUy5V6B_DkIm2S19ss81YaFceupculs1B8tOIcKCyrJ-MkQsKyRUF11kqn2TkcqVx1498v4P1Kuyi94BlJ78yC_m9d9WsP6nZNjuRJ5g3OIU0Y7T8p4EXGpuogssFWSc4-DinwhNK6MUR7NZSjE0hFkUm6UhXwc7MBTS9tqk0aOq5MVuG6R14KZD5JZHnU0ipTbeipxcOdMCLuxoJ8BVBDPYbDmMWSwiZAU1iUuNado7T85laQPnBAw-FT8iPz1S7_euQozOvYmaTTRY0yzLkhU";
      String url ="http://picktockback.herokuapp.com/api/auth/pictograma";
      List<Picto> pictos = [];
      final respuesta = await http.get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': "Bearer $token",
        },
      );
      Map data = jsonDecode(respuesta.body);
      dynamic jsonData;
      if (respuesta.statusCode == 200) {
        // dynamic jsonData = jsonDecode(respuesta.body);
        jsonData = data['data'];        
      } else if (respuesta.statusCode == 422) {
      } else if (respuesta.statusCode == 401) {
      } else {
      }
      print("separador");
      print(jsonData);
      jsonData.forEach((picto) {
        pictos.add(Picto(
          imagenURL: picto["pic_url_image"],
          titulo: picto["pic_title"],
          id: picto["id"],
          creacion: picto["created_at"],
          picVisibility: picto["visibility"],
          catId: picto["cat_id"],
        ));        
        print("pictograma : ");
        print(picto["pic_title"]);
      });      

      return pictos;
    }catch(e){
      throw Exception(e);
    }
  }
}