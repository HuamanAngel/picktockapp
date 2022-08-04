import 'package:flutter/material.dart';
import 'package:picktock/data/models/user.dart';
import 'package:picktock/domain/provider/auth_provider.dart';
import 'package:picktock/ui/widgets/custom_button.dart';
import 'package:picktock/ui/widgets/custom_text_form_field.dart';

class CreateAccountForm extends StatelessWidget {
  CreateAccountForm({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerLastname = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    if (!_isValidEmail(value.toString())) {
                      return 'Ingrese un email correcto';
                    }
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: controllerPassword,
                  icon: Icons.lock,
                  hintText: 'Contraseña',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese una contraseña';
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: CustomButton(
              text: 'Registrarse',
              function: () async {
                if (_formKey.currentState!.validate()) {
                  User user = User(
                      name: controllerName.text,
                      lastname: controllerLastname.text,
                      email: controllerEmail.text,
                      createdAt: '',
                      id: 1,
                      userNivelTea: 1);

                  bool response = await AuthProvider.register(
                      user, controllerPassword.text);
                  if (response) {
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Usuario creado"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

bool _isValidEmail(String str) {
  final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");
  return _emailRegExp.hasMatch(str.toLowerCase());
}
