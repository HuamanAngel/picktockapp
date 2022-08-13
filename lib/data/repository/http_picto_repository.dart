import 'dart:convert';

import 'package:picktock/domain/repository/abstract_picto.dart';
import 'package:picktock/styles/style.dart';
// import 'package:picktock/data/models/newpicto.dart';
import 'package:picktock/domain/repository/abstract_auth.dart';
import 'package:picktock/data/models/pictograma.dart';
import 'package:http/http.dart' as http;

class HttpPictoRepository extends AbstractPicto {
  @override
  Future<bool> addpicto(String titulo, String visibilidad, dynamic imagen,
      String categoria) async {
    try {
      var postUri = Uri.parse(baseUri + "/api/auth/pictograma");
      String url = baseUri + "/api/auth/pictograma";
      String token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNDkwYWJkYTQ0NmVjMGEwZjcwMmQxODM4MTI4NjliOGFjNWEyOWViMGQ5YmRhNWY1NTJjMDg5ZDA5YTIyZWM5NWRhMjQ4YmEyNWIwMTgzNDMiLCJpYXQiOjE2NTkxNTQ3MDEuMjY3MzAyLCJuYmYiOjE2NTkxNTQ3MDEuMjY3MzA0LCJleHAiOjE2OTA2OTA3MDEuMDkwNTUsInN1YiI6IjQiLCJzY29wZXMiOltdfQ.Fdt8lrVLuFwJswUXIH5l0D4t67LotDmg_bZLEJCg3Y_ByXJ9OuDA8iPJs15mIR1---8u0-pV9yAMOvVW_VcmGRKPjRO98mBsHiODBci87KQWxd8Ry5ix9Edx4TxVpQgxr5qogohzMGbvBgOxZxoHeojpqCAF2XacDEpK2brF-hTLAExSFNb8NhlmD2ErTZvNU66SOCwxTu9wNt2zLOwvD7kNlo4kL8lrv6B2NWZRcZlX5D5EElWWTFJj79SUNUl_x-eT-6F8tBzplHdEA5_3oguVAXsyS5DUJlAqWHIdKjcUTkBWskcZ0Pd0ILD9llhM0P-mL-9x8WE8oySP5PG_VDDiCjPMgG-3KQR-PuJJkf-hBAXXYJn98zrH_uRhawG9Zfcg3ejEnPRQ7FHkappM39A5xSdXQHe7Ta77Rn-djLoddUr87Uao0g-bvXNFMPx9k6OoYUBe07Ww2OWJrdVyteM3wnz8863-6JZLI483GuXIBNlR3ViOvSbb0n35fX0rnZKffYSv7q1nzplppgtsHo5Mg2bpHHe2CjqEcxs-pdXbhq8-DIeZSgyJhPPvlFaDmiejf38NQI16sQ3lUU9BbVfBtX8dTYCsnE_xIe_ewPsCTSZFqWfe7lrx8bS3eiJVfkfwwOeECgEO1ilwy3yCVom7GAN4vh43zEtDm2UwNXM";
      var request = http.MultipartRequest("POST", postUri);
      request.fields['pic_title'] = titulo;
      request.fields['pic_visibility'] = visibilidad;
      request.fields['cat_id'] = categoria;
      request.headers.addAll(
          {"Authorization": "Bearer $token", "Accept": "application/json"});
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('pic_image', imagen);
      request.files.add(multipartFile);
      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      // print(response.statusCode);
      // print(respStr);
      Map valor = jsonDecode(respStr);

      if (response.statusCode == 201) {
        print("Creado correctamente");
        return true;
      } else if (response.statusCode == 422) {
        dynamic jsonData = jsonDecode(valor['errors']);
        print(jsonData);
        print("Error en Validaciones");
        return false;
      } else {
        dynamic jsonData = jsonDecode(valor['errors']);
        print(jsonData);
        print("Error no encontrado");
        print(response.statusCode);
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Picto>> getPictos() async {
    try {
      String token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNDkwYWJkYTQ0NmVjMGEwZjcwMmQxODM4MTI4NjliOGFjNWEyOWViMGQ5YmRhNWY1NTJjMDg5ZDA5YTIyZWM5NWRhMjQ4YmEyNWIwMTgzNDMiLCJpYXQiOjE2NTkxNTQ3MDEuMjY3MzAyLCJuYmYiOjE2NTkxNTQ3MDEuMjY3MzA0LCJleHAiOjE2OTA2OTA3MDEuMDkwNTUsInN1YiI6IjQiLCJzY29wZXMiOltdfQ.Fdt8lrVLuFwJswUXIH5l0D4t67LotDmg_bZLEJCg3Y_ByXJ9OuDA8iPJs15mIR1---8u0-pV9yAMOvVW_VcmGRKPjRO98mBsHiODBci87KQWxd8Ry5ix9Edx4TxVpQgxr5qogohzMGbvBgOxZxoHeojpqCAF2XacDEpK2brF-hTLAExSFNb8NhlmD2ErTZvNU66SOCwxTu9wNt2zLOwvD7kNlo4kL8lrv6B2NWZRcZlX5D5EElWWTFJj79SUNUl_x-eT-6F8tBzplHdEA5_3oguVAXsyS5DUJlAqWHIdKjcUTkBWskcZ0Pd0ILD9llhM0P-mL-9x8WE8oySP5PG_VDDiCjPMgG-3KQR-PuJJkf-hBAXXYJn98zrH_uRhawG9Zfcg3ejEnPRQ7FHkappM39A5xSdXQHe7Ta77Rn-djLoddUr87Uao0g-bvXNFMPx9k6OoYUBe07Ww2OWJrdVyteM3wnz8863-6JZLI483GuXIBNlR3ViOvSbb0n35fX0rnZKffYSv7q1nzplppgtsHo5Mg2bpHHe2CjqEcxs-pdXbhq8-DIeZSgyJhPPvlFaDmiejf38NQI16sQ3lUU9BbVfBtX8dTYCsnE_xIe_ewPsCTSZFqWfe7lrx8bS3eiJVfkfwwOeECgEO1ilwy3yCVom7GAN4vh43zEtDm2UwNXM";
      String url = "http://picktockback.herokuapp.com/api/auth/pictograma";
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
      } else {}
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
    } catch (e) {
      throw Exception(e);
    }
  }
}
