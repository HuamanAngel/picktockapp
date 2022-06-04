import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoria extends StatelessWidget {
  const AddCategoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const GenerateAppTitle = "Añadir Categoria de Pictograma";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: GenerateAppTitle,
      home: Material(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/textures/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: AddirScreen(),
              ),
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}

class AddirScreen extends StatefulWidget {
  const AddirScreen({Key? key}) : super(key: key);

  @override
  AddirScreenState createState() {
    return AddirScreenState();
  }
}

class AddirScreenState extends State<AddirScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _tituloInput(),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _textImagButton()),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _imagButton(),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _createButton()),
            ]));
  }

  Widget _tituloInput() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Inserte el nombre de la categoría',
        labelText: 'Categoría',
      ),
    );
  }

  Widget _textImagButton() {
    return const Text(
      'IMAGEN PARA CATEGORÍA',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _imagButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Subir imagen'),
    );
  }

  Widget _createButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Scaffold.of(context)
              .showSnackBar(const SnackBar(content: Text('Creación correcto')));
        }
      },
      child: const Text('Crear'),
      style: ElevatedButton.styleFrom(
          primary: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
          textStyle:
              const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
    );
  }
}
