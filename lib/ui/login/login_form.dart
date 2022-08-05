import 'package:flutter/material.dart';
import 'package:picktock/data/models/user.dart';
import 'package:picktock/domain/provider/auth_provider.dart';
import 'package:picktock/domain/provider/menuProvider.dart';
import 'package:picktock/ui/widgets/custom_button.dart';
import 'package:picktock/ui/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  bool _isLoading = false;

  setLoading(bool state) => setState(() => _isLoading = state);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final menuProvider = Provider.of<MenuProvider>(context);
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              controller: _controllerEmail,
              hintText: 'Correo',
              icon: Icons.person,
              validator: (String? s) {},
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: _controllerPassword,
              hintText: 'Contraseña',
              icon: Icons.lock,
              validator: (String? s) {},
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: !_isLoading ? "Iniciar sesión" : null,
              child: _isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )
                  : null,
              function: () async {
                if (_formKey.currentState!.validate()) {
                  setLoading(true);
                  User user = await AuthProvider.login(
                      _controllerEmail.text, _controllerPassword.text);
                  print(user.id);
                  if (user.id != -1) {
                    authProvider.user = user;
                    // Redirige a la pantalla principal
                    setLoading(false);
                    menuProvider.menu = "Inicio";
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Logeado correctamente'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    setLoading(false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Credenciales inválidas'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
