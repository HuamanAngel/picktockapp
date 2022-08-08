import 'package:flutter/material.dart';
import 'package:picktock/ui/extensions/content_wrapper.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final String? Function(String?)? validator;
  final List<FocusNode> focusNodes;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.hintText,
    required this.validator,
    required this.focusNodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNodes.first,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(focusNodes.last);
      },
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 237, 184),
        suffixIcon: Icon(icon, color: Colors.blue.shade700),
        hintText: hintText,        
        hintStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ), 
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade900, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade700),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),       
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
      ),
    );
  }
}
