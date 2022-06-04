import 'package:flutter/material.dart';
import 'package:picktock/domain/provider/comunityProvider.dart';
import 'package:provider/provider.dart';
import 'package:picktock/domain/provider/menuProvider.dart';
import 'package:picktock/ui/home.dart';

void main() {
  runApp(PickTock());
}

class PickTock extends StatelessWidget {
  PickTock();
  @override
  Widget build(BuildContext context) {
    return MultiProvider (
      providers: [
        ChangeNotifierProvider<MenuProvider>(
          create: (_) => MenuProvider(),
        ),
        ChangeNotifierProvider<ComunityProvider>(
          create: (_) => ComunityProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "PickTock",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
