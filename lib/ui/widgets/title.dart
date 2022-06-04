import 'package:flutter/material.dart';

Widget titleFirst({required String textTitle}) {
  return Text(
    textTitle,
    textAlign: TextAlign.center,
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );
}
