import 'package:flutter/material.dart';

// Solo pasar el texto o el child, no ambos
class CustomButton extends StatelessWidget {
  final Future<void> Function() function;
  final FocusNode focus;
  final String text;
  final bool loading;
  const CustomButton(
      {Key? key,
      required this.function,
      required this.text,
      required this.loading,
      required this.focus,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        alignment: AlignmentDirectional.center,
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
          TextButton(
            focusNode: focus,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              primary: loading ? Colors.transparent : Colors.white,
              textStyle: const TextStyle(fontSize: 16),
            ),
            onPressed: function,
            child: Text(text),
          ),
          if (loading)
            const Positioned.fill(
              child: Center(
                child: SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
