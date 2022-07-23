import 'package:flutter/material.dart';
import 'package:picktock/ui/pictograma/pictograma.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
