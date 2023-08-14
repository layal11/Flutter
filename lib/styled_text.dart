import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {

  const StyledText(this.text, {super.key}); //accept an argmnt
  final String text; //store argmnt in instance variables

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text, //use argmnt
        style: const TextStyle(
          fontSize: 28,
          color: Colors.white,
        ),
      ),
    );
  }
}
