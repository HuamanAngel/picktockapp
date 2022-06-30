import 'package:flutter/material.dart';
import 'package:picktock/styles/style.dart';
import 'package:picktock/ui/widgets/title.dart';

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);
  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: styleContainer1['padding'],
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: titleFirst(textTitle: "MI PERFIL"),
              flex: 8,
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              flex: 2,
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Image.asset(
                "assets/imagen.jpg",
                fit: BoxFit.cover,
              ),
              flex: 4,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                  decoration:  BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nombre",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      selectLvlTEA()                      
                    ],
                  )),
              flex: 8,
            ),
          ],
        ),
      ]),
    );
  }
}

Widget selectLvlTEA() {
  return DropdownButton<String>(
    // value: dropdownValue,
    icon: const Icon(Icons.arrow_downward),
    elevation: 16,
    style: const TextStyle(color: Colors.deepPurple),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    onChanged: (String? newValue) {
      // setState(() {
      //   dropdownValue = newValue!;
      // });
    },
    items: <String>['Nivel 1', 'Nivel 2', 'Nivel 3', 'Nivel 4']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}