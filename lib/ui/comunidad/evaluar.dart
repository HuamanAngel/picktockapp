import 'package:flutter/material.dart';
import 'package:picktock/styles/style.dart';
import 'package:picktock/ui/widgets/title.dart';

class EvaluateComunity extends StatefulWidget {
  EvaluateComunity({Key? key}) : super(key: key);

  @override
  State<EvaluateComunity> createState() => _EvaluateComunityState();
}

class _EvaluateComunityState extends State<EvaluateComunity> {
  final _formKey = GlobalKey<FormState>();
  final controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: styleContainer1['padding'],
        child: Column(children: [
          titleFirst(textTitle: "¿Aprobar el pictorama?"),
          SizedBox(height: 10),
          titleFirst(textTitle: "Saluda"),
          SizedBox(height: 10),
          Text("Pictograma"),
          Container(
            width: 400,
            child: TextFormField(
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
                labelText: "Insertar razon de rechazo",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Necesita insertar una razon';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(color: Colors.red),
                  width: 100,
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Rechazo el pictograma')));
                        }
                      },
                      child: Text("X"))),
              Container(
                  decoration: BoxDecoration(color: Colors.red),
                  width: 100,
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Acepto el pictograma')));
                      },
                      child: Text("O"))),
            ],
          )
        ]),
      ),
    );
  }
}