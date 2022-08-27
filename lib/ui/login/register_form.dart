import 'package:flutter/material.dart';
import 'package:picktock/data/models/failure.dart';
import 'package:picktock/data/models/user.dart';
import 'package:picktock/domain/provider/auth_provider.dart';
import 'package:picktock/domain/provider/menu_provider.dart';
import 'package:picktock/ui/widgets/custom_button.dart';
import 'package:picktock/ui/widgets/custom_text_form_field.dart';
import 'package:picktock/ui/widgets/password_text_form_field.dart';
import 'package:picktock/utils/validators.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final AuthProvider authProvider = AuthProvider();

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerLastname = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    _focusNodes = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
    ];
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerLastname.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    Future<void> onSubmit() async {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        User user = User(
          name: controllerName.text,
          lastname: controllerLastname.text,
          email: controllerEmail.text,
          createdAt: '',
          id: 1,
          userNivelTea: 1,
        );
        try {
          await AuthProvider.register(user, controllerPassword.text);
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Usuario creado"),
              backgroundColor: Colors.green,
            ),
          );
          menuProvider.authPageState = AuthPageState.login;
        } on Failure catch (e) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextFormField(
                        controller: controllerName,
                        icon: Icons.person,
                        hintText: 'Nombre de usuario',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese el nombre de usuario';
                          }
                        },
                        focusNodes: [_focusNodes[0], _focusNodes[1]],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: CustomTextFormField(
                        controller: controllerLastname,
                        icon: Icons.person,
                        hintText: 'Apellidos',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese el nombre de usuario';
                          }
                        },
                        focusNodes: [_focusNodes[1], _focusNodes[2]],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: controllerEmail,
                  icon: Icons.email,
                  hintText: 'Correo',
                  validator: (value) {
                    if (!isValidEmail(value!)) {
                      return 'Ingrese un email válido';
                    }
                  },
                  focusNodes: [_focusNodes[2], _focusNodes[3]],
                ),
                const SizedBox(height: 10),
                PasswordTextFormField(
                  controller: controllerPassword,
                  formKey: _formKey,
                  focusNodes: [_focusNodes[3], _focusNodes[4]],
                  onSubmit: onSubmit,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿Ya tienes una cuenta? ",
                  style: TextStyle(color: Colors.blue.shade900),
                ),
                GestureDetector(
                  onTap: () {
                    menuProvider.authPageState = AuthPageState.login;
                  },
                  child: Text(
                    "Inicia sesión",
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
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: CustomButton(
              focus: _focusNodes[4],
              loading: _isLoading,
              text: 'Registrarse',
              function: onSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
