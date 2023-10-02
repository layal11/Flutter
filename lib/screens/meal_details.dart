import 'package:first_flutter_app/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: const [],
      ),
      body: Image.network(
        meal.imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );

    //     Text('affordability'),
    //     Text('complexity'),
    //     Text('ingredients'),
  }
}
