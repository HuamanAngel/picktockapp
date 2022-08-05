import 'package:flutter/material.dart';

extension ContentWrapper on List<Widget> {
  Widget wrapContainer(context) {
    return Center(
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width - 260,
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
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}