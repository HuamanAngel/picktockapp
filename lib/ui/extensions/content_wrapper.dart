import 'package:flutter/material.dart';
extension ContentWrapper on List<Widget> {
  Widget wrapContainer() {
    // return ScrollConfiguration(
    //   behavior: MyBehavior(),
      return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 193, 7),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(150),
                blurRadius: 5,
                offset: const Offset(10, 10),
              )
            ],
          ),
          child: Column(
            children: this,
          ),
        ),
      // ),
    );
  }
}
extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
  }
}

// class MyBehavior extends ScrollBehavior {
//   @override
//   Widget buildOverscrollIndicator(
//       BuildContext context, Widget child, ScrollableDetails details) {
//     return child;
//   }
// }