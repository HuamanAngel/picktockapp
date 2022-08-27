import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final List<FocusNode> focusNodes;
  final Future<void> Function() onSubmit;
  const PasswordTextFormField({
    Key? key,
    required this.controller,
    required this.formKey,
    required this.focusNodes,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNodes.first,      
      obscureText: !_isPasswordVisible,
      enableSuggestions: false,
      autocorrect: false,      
      onFieldSubmitted: (_) async {
        print("Ejecutando");
        widget.onSubmit;
        print("Terminando de ejecutar");
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ingrese una contraseña';
        }
        if (value.length < 6) {
          return 'Su contraseña debe tener al menos 6 caracteres';
        }
      },
      controller: widget.controller,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.red,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 237, 184),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade900, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade700),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        hintText: "Contraseña",
        suffixIcon: InkWell(
          onTap: (() {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          }),
          child: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.blue.shade700),
        ),
        hintStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
