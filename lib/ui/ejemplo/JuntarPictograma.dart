import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Prueba extends StatelessWidget {
  const Prueba({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: Container(


          margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CampoTextoEmail(),
                SizedBox(
                  height: 50,
                ),
                CampoTextoPassword(),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: FlatButton(
                      child: Text(
                        "Combinar Pictograma",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {}),
                )
              ],
            ),
          )
      ),

    );
  }
}

Widget CampoTextoEmail(){
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - Search Box
          Expanded(
            child: Container(
              height: 50,
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/search.svg', color: Colors.white, height: 18, width: 18),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Escribe tu producto',
                      style: TextStyle(color: Colors.black.withOpacity(0.3)),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Right side - filter button
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset('assets/icons/filter.svg'),
          )
        ],
      ),
    ),
  );
}

Widget CampoTextoPassword(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset('assets/imagen.jpg'),
      Image.asset('assets/imagen.jpg'),
      Image.asset('assets/imagen.jpg'),
      Image.asset('assets/imagen.jpg'),
      Image.asset('assets/imagen.jpg'),
    ],
  );
}


