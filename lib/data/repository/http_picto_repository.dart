import 'dart:convert';

import 'package:picktock/domain/repository/abstract_picto.dart';
import 'package:picktock/styles/style.dart';
import 'package:picktock/data/models/newpicto.dart';
import 'package:picktock/domain/repository/abstract_auth.dart';
import 'package:http/http.dart' as http;

class HttpPictoRepository extends AbstractPicto {
  @override
  Future<bool> mostrarPicto(NewPicto newPicto) async {
    try {
      String url = baseUri + "/api/auth/pictograma";
      String token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiOTdlNjQyM2VlMzVlNGQyZGFiNTBmYzMxNTI3Yzk0ZTVlMTkyOTg1N2ZhZDRkMzM3YTQzMmJjZmFmYzI2NTQ0MjlkNDZjNTIwZDM3NGIyMGUiLCJpYXQiOjE2NTc5OTE2ODguNjAxNjI0LCJuYmYiOjE2NTc5OTE2ODguNjAxNjI2LCJleHAiOjE2ODk1Mjc2ODguNDQxODUzLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.X7hP9yBjBD3u4ff9Hr0Wiy11myRWjIQf2Ay_enNd4s0P5El_lKeQqwcel2Y9olWskXu1mCLaLB6qBpQXiDmHgTPl_49AJ0bTDl4DjagAmmD10RHDkkuEGzqhCBIUAytMeq5eWv01jvy_CJIGT4hpbFCIwWBj__s_DyJTpcp4HM9uS-EzXJAs_CH3uSXxnoFbDW0ShYPZ9KRGKomIlvfkLaf73AsKeo7VoKKQXe1JwAISPhCoijqTa8om1N9GnCHLExG3dnRkz6UU9NGuTTTlZ0urnxlDl6CZle1MCuoMkAMpkZto2AeqhklXxb-h7k_KZJWXMKocpBKf6EI5bNE8nqlACYd9xUJOWCujf5bVACqGIfwUoMzwsvYBsoJfi33UGFtpbrRQf1p61re0-v0DHW79oe3kFxYLwjLzZD4oKpoIel-Japjcn_kQY0VeEZt0_cZaG_GJPEPprqLWEZkPRk9nnqq1nWqgA1rrivaVJ34OflRB2MRI1Dr41g3JfQxqkNScpShFrGkWmND9MT2F-IuH6vDqr83uMBPpKiMLzwEybe9v8UBItF9R4zWxrHkVkA5mcLNlZqmPxug62S2nyveXthRtvMjGS9LGy6aOSHxo3t91liGuXiRCX6MhDsY5BE13pVGidiW_-uGjgDBa2OrVPsZjjMVANhJOMN9WivQ";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': "Bearer $token",
        },
      );
      print(response);
      if (response.statusCode == 201) {
        dynamic jsonData = jsonDecode(response.body);
        jsonData = jsonData['message'];
        print(jsonData);
        print(response.body);
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
