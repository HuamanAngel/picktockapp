import 'package:flutter/material.dart';
import 'package:picktock/data/models/failure.dart';
import 'package:picktock/data/models/user.dart';
import 'package:picktock/domain/provider/auth_provider.dart';
import 'package:picktock/domain/provider/menu_provider.dart';
import 'package:picktock/ui/widgets/custom_button.dart';
import 'package:picktock/ui/widgets/custom_text_form_field.dart';
import 'package:picktock/ui/widgets/password_text_form_field.dart';
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
  final _focusNodes = [];
  bool _isLoading = false;
  setLoading(bool state) => setState(() => _isLoading = state);

  @override
  void initState() {
    super.initState();
    _focusNodes.add(FocusNode());
    _focusNodes.add(FocusNode());
    _focusNodes.add(FocusNode());
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final menuProvider = Provider.of<MenuProvider>(context);

    Future<void> onSubmit() async {
      if (_formKey.currentState!.validate()) {
        setLoading(true);
        try {
          User user = await AuthProvider.login(
              _controllerEmail.text, _controllerPassword.text);
          print(user.id);
          if (user.id != -1) {
            menuProvider.authPageState = AuthPageState.loguedIn;
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
        } on Failure catch (e) {
          setLoading(false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
      }
    }

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
              focusNodes: [_focusNodes[0], _focusNodes[1]],
            ),
            const SizedBox(height: 10),
            PasswordTextFormField(
              controller: _controllerPassword,
              formKey: _formKey,
              focusNodes: [_focusNodes[1], _focusNodes[2]],
              onSubmit: onSubmit,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿No tienes una cuenta? ",
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      menuProvider.authPageState = AuthPageState.register;
                    },
                    child: Text(
                      "Regístrate",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              text: "Iniciar sesión",
              loading: _isLoading,
              focus: _focusNodes[2],
              function: onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
