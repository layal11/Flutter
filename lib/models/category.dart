// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// const uuid = Uuid();

// enum Categories {
//   fastFood,
//   veggies,
//   diet,
//   burgers,
//   pizza,
// }

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;
}
