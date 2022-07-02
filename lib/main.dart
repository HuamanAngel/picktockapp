import 'package:flutter/material.dart';
import 'package:picktock/domain/provider/auth_provider.dart';
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
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
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

// import 'package:flutter/material.dart';

// void main() {
//   runApp(LoginApp());
// }

// class LoginApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final titulo = 'Formulario de Validacion de Campos !!';
//     return MaterialApp(
//       home: Scaffold(
//         appBar: (AppBar(title: Text(titulo))),
//         body: MyHomeLoginApp(),
//       ),
//     );
//   }
// }

// class MyHomeLoginApp extends StatefulWidget {
//   @override
//   State<MyHomeLoginApp> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomeLoginApp> {
//   // Graba el estado que se encuentra el formulario

//   static final RegExp _emailRegExp = RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");
//   final _formKey = GlobalKey<FormState>();

//   bool _isEmail(String str)
//   {
//     return _emailRegExp.hasMatch(str);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             SizedBox(height: 40),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Email : '),
//               validator: (value) {
//                 if (!_isEmail(value.toString())){
//                   return 'Ingrese un email valido';
//                 }
//                 // if (value!.isEmpty) {
//                 //   return 'Ingrese el EMAIL';
//                 // }
//               },
//             ),
//             TextFormField(
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password : '),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Ingrese la contraseña';
//                 }
//               },
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 80, horizontal: 120),
//               child: RaisedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     Scaffold.of(context).showSnackBar(
//                         SnackBar(content: Text('Accesando al sistema')));
//                   }
//                 },
//                 child: Text('Entrar'),
//                 color: Colors.blue,
//                 textColor: Colors.white,
//               ),
//             ),
//           ],
//         ));
//   }
// }



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Navegacion Basica',
//     home: FirstRoute(),
//   ));
// }

// class FirstRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pantalla Inicial '),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text('Ir ==>'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SecondRoute()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

//  class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Pantalla Final "),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('<== Volver'),
//         ),
//       ),
//     );
//   }
//   }