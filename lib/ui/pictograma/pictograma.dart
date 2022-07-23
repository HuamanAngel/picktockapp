import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:picktock/domain/utilities/reproducir.dart';
import 'package:provider/provider.dart';
import 'package:picktock/ui/pictograma/cambiarvoz.dart';
import 'package:picktock/ui/pictograma/picto.dart';
import 'package:picktock/data/models/pictograma.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:picktock/domain/provider/pictoProvider.dart';
import 'package:http/http.dart' as http;

class Pictograma extends StatefulWidget {
  const Pictograma({Key? key})
      : super(key: key);
  @override
  State<Pictograma> createState() => _PictogramaState();
}

class _PictogramaState extends State<Pictograma> {
  final controllerSearch = TextEditingController();
  late Future<List<Picto>> _listadoPictos;
  bool dataDescargada = false;
  List<Picto> pictos = [];
  Future<SharedPreferences> preferencias = SharedPreferences.getInstance();
  String? token;
  bool _isLoading = true;
  setLoading(bool state) => setState(() => _isLoading = state);

  // Future<List<Picto>> _getPictos() async {
    // final SharedPreferences pref2 = await preferencias;
    // setState(() {
    //   // token = (pref2.getString("token") ?? 's');
    //   token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNGI4MWQ0MGRmM2QwNmEzY2JlYzEyOWY2MjUyZTI1YTUyNzBiYjNjNThmNzhiMTVkMjBkMGNjYTVlYWMzODY2OTRhZDJlNzdjZmJmNTAwMjYiLCJpYXQiOjE2NTg1ODg2OTguNzcwNTY1LCJuYmYiOjE2NTg1ODg2OTguNzcwNTY3LCJleHAiOjE2OTAxMjQ2OTguNjA4NjU1LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.o1MZy1IealJqBLy-0oF1J5AI4Qtb27A67eIfzO_av7LeY1k1Oo1fgtWcTgh6rFAKvJjRwxFZZS_X36-2cqCyGFILALv08CHAUJUDlqsjnkyJDG7ywccTmX-8GS5sWT3iJJZOEP6jK3Tk9pNWmgRtgAU17xfH8-hqevCFHd8rAb2JYgU48HxiOIjjTTlYbTj1X_B4c62NmfqWI0CbkhI1M_nS6Q5fAHKhXMVc0vyQY0BR1BVdFI5SQEx_FtWs-Md8PqBR5bc6m2Q0HY6yZHSi9SAiFbTV0x1aRusY2ZigGNsgK3EdzYhzakPCSpJsXqI8kGVMA9sDcwa-771qFDIgk87QHYq7y3sg-u6gfPRE6CvIZ8HMEbdXpgLea9RcD08Y6ywWlUDGBmFxydTxiJqFiUy5V6B_DkIm2S19ss81YaFceupculs1B8tOIcKCyrJ-MkQsKyRUF11kqn2TkcqVx1498v4P1Kuyi94BlJ78yC_m9d9WsP6nZNjuRJ5g3OIU0Y7T8p4EXGpuogssFWSc4-DinwhNK6MUR7NZSjE0hFkUm6UhXwc7MBTS9tqk0aOq5MVuG6R14KZD5JZHnU0ipTbeipxcOdMCLuxoJ8BVBDPYbDmMWSwiZAU1iUuNado7T85laQPnBAw-FT8iPz1S7_euQozOvYmaTTRY0yzLkhU";
    // });
    // bool auth = (pref2.getBool("auth") ?? false);
    // String url = " ";
    //   if (auth) {
    //     url =
    //     "http://picktockback.herokuapp.com/api/auth/pictograma";
    //   } else {
    //     url =
    //     "http://picktockback.herokuapp.com/api/auth/pictograma";
    //   }

    // try {
    //   final respuesta = await http.get(
    //     Uri.parse(url),
    //     headers: {
    //       'Content-type': 'application/json',
    //       "Accept": "application/json",
    //       'Authorization': "Bearer $token",
    //     },
    //   );
    //   Map data = jsonDecode(respuesta.body);
    //   setState(() {});
    //   setLoading(false);
    //   dynamic jsonData;
    //   if (respuesta.statusCode == 200) {
    //     // dynamic jsonData = jsonDecode(respuesta.body);
    //     jsonData = data['data'];        
    //   } else if (respuesta.statusCode == 422) {
    //     setState(() {});
    //   } else if (respuesta.statusCode == 401) {
    //     setState(() {});
    //   } else {
    //     setState(() {});
    //   }

    //   print("separador");
    //   print(jsonData);
    //   jsonData.forEach((picto) {
    //     pictos.add(Picto(
    //       imagenURL: picto["pic_url_image"],
    //       titulo: picto["pic_title"],
    //       id: picto["id"],
    //       picVisibility: picto["visibility"],
    //       catId: picto["cat_id"],
    //     ));        
    //     // print(picto);
    //     print(picto["pic_title"]);
    //     // print("${car.name} is electric? ${car.isElectric}");
    //   });      
    //   setState(() => dataDescargada = true);
    //   return pictos;
    // } catch (error) {
    //   throw Exception(error);
    // }
  // }

  @override
  initState() {
    super.initState();
    token = " ";
    // _listadoPictos = _getPictos();
    // await Auth AuthProvider.register(user, controllerPassword.text);    
  }


  @override
  Widget build(BuildContext context) {
    final pictoProvider = Provider.of<PictoProvider>(context);
    
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              ordenar(icon: Icons.sort,text: "Alfabeto"),              
              ordenar(icon: Icons.sort,text: "Recientes"),              
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: Colors.black26),
                  ),
                  child: TextField(
                    controller: controllerSearch,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          controllerSearch.clear();
                        },
                      ),
                      fillColor: Colors.red,
                      border: OutlineInputBorder(),
                      labelText: "Nombre del pictograma",
                    ),
                  ),
                ),
                flex: 6,
               ),
              ],
          ),
          Row(
             children: [
              Spacer(),
              Container(
                  margin: EdgeInsets.only( left: 50),
                 child: FlatButton(
                     child: Text(
                       "Combinar Pictograma",
                       style: TextStyle(color: Colors.white, fontSize: 20),
                     ),
                     color: Colors.green,
                     onPressed: () {}
                   )
               )
             ]
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent, //color azul
              child: dataDescargada
                  ? GridView.builder(
                  itemCount: pictos.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Pictogr(
                      id: index,
                      nombre: pictos[index].titulo,
                      rutaImagen: pictos[index].imagenURL,
                      idPictograma:
                      pictos[index].idPictograma,
                      creacion: pictos[index].creacion,
                    );
                  })
                  : const Center(
                child: CircularProgressIndicator(),
              ),
            ),


          ),


          Row(
            children: [
              Spacer(),
              Voz(),
              ]
          ),
         /* Row(
              child: Container(
                child: paginacion(),
              ),
          ),
*/
        ],
      ),
    );
  }
}

Widget ordenar({required IconData icon, required String text}) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    child: ElevatedButton(
        onPressed: () {
          print(text);
        },
        child: Row(
          children: [Icon(icon), Text(text)],
        )),
  );
}

