import 'package:flutter/material.dart';

class Favorito extends StatefulWidget {
  @override
  State<Favorito> createState() => _FavoritoState();
}

class _FavoritoState extends State<Favorito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber.shade100,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(50),
            ),
            margin: const EdgeInsets.only(
                top: 200, left: 300, right: 300, bottom: 200),
          ),
        ));
  }
}