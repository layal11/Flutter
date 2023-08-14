import 'package:flutter/material.dart';
import 'package:first_flutter_test/first_widget.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: FirstWidget(
          Color.fromARGB(255, 164, 26, 172),
          Color.fromARGB(255, 242, 143, 247),
        ),
      ),
    ),
  );
}
