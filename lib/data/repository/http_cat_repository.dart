import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:picktock/data/models/categorie.dart';
import 'package:picktock/styles/style.dart';
import 'package:picktock/domain/repository/abstract_cat.dart';
import 'package:http/http.dart' as http;

class HttpCatRepository extends AbstractCat {
  List<Categorie> cat = [];
  @override
  Future<bool> addCategorie(Categorie categorie) async {
    try {
      String url = baseUri + "/api/auth/categorie";
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'application/json',
            "Accept": "application/json",
            'Authorization':
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiMDJmOGI0Y2I3OGUxYTRmZTFkMmJlMDNlZWUyMTFjMWRhY2VkOGI4OTE2Y2RjNzQ1OTMyZWZmNjM2MzY0MGQ2MWY5NDkzYzU1ZjgyMzQ4MzYiLCJpYXQiOjE2NTkxMzE1MDguMTk5MDUzLCJuYmYiOjE2NTkxMzE1MDguMTk5MDU1LCJleHAiOjE2OTA2Njc1MDguMDEyMDc5LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.jyNysZUzyTWN3gtyLlFZ1Jpsaz9IUegqSSUVOzVRcmIZWjoVd6lu6XMEe8nOQD6WO-X5cnqLh_FHTXnQnP2FFZbKj46rHPrczp80X8g6gLD9ZK-8IIn73leSs3_rW7d-i_a9oXciXft-ECmrZEPcq2ThJyDPhRlMOdcREsx0h3lHOVU7_WPztwaGo2YBto--fogtEitY7usK3h6aKciSYuJGXHVEKL-P_VI-Wd24JP_MNIXWeMQOs165Hwmsggf2HNd-pr4stC3WF40etadlPVxHbddOkrJKIcnE4yK1_vtGbfS0-7lXW61I8qRGj2IQTCBdXpjidLiBfCE39nbOC9HuqAIyjdLCIG6-7ra7tGMuHMw17CX3avZTGQlUNhwep2pM0ek_kUXW3wKu4gx7zPOkpNuoK9quFLVSBJi7eEKCmNXopelTQUQWDOVKay4Gg7z5EKd5Cf3YZJEsFb1_YrZ85UiTw_ib_NIT9ZwAPff7XfHu9Gll5vRErzZylZe6tvfWqbzcpzrmYZZkMqsqnsMAPc9OvGSE3f7FdHy3Cf0mcFJNFk6F0LO8JEbOnw0r3HGEuo6iHqav2kmXCwUaL1qZYI2wh0EkErd-kBozcf4kBtsivQR-HA9BU8M6eck24AjlOMZKpAL5sMes2Q1MAyzroMeLv9aHzrO8oxbpkzE",
          },
          body: jsonEncode({
            "nameCategory": categorie.titulo,
            "cat_image": categorie.imagen,
          }));
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
  Future<List<Categorie>> listar() async {
    try {
      String url = baseUri + "/api/auth/categorie";
      final response = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'Authorization':
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiMDJmOGI0Y2I3OGUxYTRmZTFkMmJlMDNlZWUyMTFjMWRhY2VkOGI4OTE2Y2RjNzQ1OTMyZWZmNjM2MzY0MGQ2MWY5NDkzYzU1ZjgyMzQ4MzYiLCJpYXQiOjE2NTkxMzE1MDguMTk5MDUzLCJuYmYiOjE2NTkxMzE1MDguMTk5MDU1LCJleHAiOjE2OTA2Njc1MDguMDEyMDc5LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.jyNysZUzyTWN3gtyLlFZ1Jpsaz9IUegqSSUVOzVRcmIZWjoVd6lu6XMEe8nOQD6WO-X5cnqLh_FHTXnQnP2FFZbKj46rHPrczp80X8g6gLD9ZK-8IIn73leSs3_rW7d-i_a9oXciXft-ECmrZEPcq2ThJyDPhRlMOdcREsx0h3lHOVU7_WPztwaGo2YBto--fogtEitY7usK3h6aKciSYuJGXHVEKL-P_VI-Wd24JP_MNIXWeMQOs165Hwmsggf2HNd-pr4stC3WF40etadlPVxHbddOkrJKIcnE4yK1_vtGbfS0-7lXW61I8qRGj2IQTCBdXpjidLiBfCE39nbOC9HuqAIyjdLCIG6-7ra7tGMuHMw17CX3avZTGQlUNhwep2pM0ek_kUXW3wKu4gx7zPOkpNuoK9quFLVSBJi7eEKCmNXopelTQUQWDOVKay4Gg7z5EKd5Cf3YZJEsFb1_YrZ85UiTw_ib_NIT9ZwAPff7XfHu9Gll5vRErzZylZe6tvfWqbzcpzrmYZZkMqsqnsMAPc9OvGSE3f7FdHy3Cf0mcFJNFk6F0LO8JEbOnw0r3HGEuo6iHqav2kmXCwUaL1qZYI2wh0EkErd-kBozcf4kBtsivQR-HA9BU8M6eck24AjlOMZKpAL5sMes2Q1MAyzroMeLv9aHzrO8oxbpkzE"
      });
      dynamic jsonData = "";
      if (response.statusCode == 201) {
        jsonData = jsonDecode(response.body);
        jsonData = jsonData['data'];
      } else if (response.statusCode == 422) {
      } else {}
      ;

      int tam = jsonData.length;

      for (int i = 0; i < tam; i++) {
        cat.add(Categorie(
            id: i,
            titulo: jsonData[i]["nameCategory"],
            imagen: jsonData[i]["cat_image"],
            creacion: ""));
      }
      return cat;
    } catch (e) {
      throw Exception(e);
    }
  }
}
