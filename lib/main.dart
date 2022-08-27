import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picktock/domain/provider/auth_provider.dart';
import 'package:picktock/domain/provider/comunity_provider.dart';
import 'package:provider/provider.dart';
import 'package:picktock/domain/provider/menu_provider.dart';
import 'package:picktock/domain/provider/picto_provider.dart';
import 'package:picktock/ui/home.dart';

void main() {
  runApp(const PickTock());
}
class PickTock extends StatelessWidget {
  const PickTock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuProvider>(
          create: (_) => MenuProvider(),
        ),
        ChangeNotifierProvider<ComunityProvider>(
          create: (_) => ComunityProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<PictoProvider>(
          create: (_) => PictoProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "PickTock",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          dividerTheme: const DividerThemeData(
            thickness: 1,
            color: Colors.white,
            space: 0,
          ),
        ),
        home: const Home(),
      ),
    );
  }
}
