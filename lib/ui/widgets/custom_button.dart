import 'package:flutter/material.dart';


// Solo pasar el texto o el child, no ambos
class CustomButton extends StatelessWidget {
  final void Function() function;
  final String? text;
  final Widget? child;
  const CustomButton({Key? key, required this.function, this.text, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),
          if (child != null) Center(child: child!),
          if (text != null)
            TextButton(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: function,
              child: Text(text!),
            ),
        ],
      ),
    );
  }
}
