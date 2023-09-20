import 'package:first_flutter_app/models/meal.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.title});
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => Text(
        meals[index].title,
      ),
    );

    if (meals.isEmpty) {
      body = const Center(
        child: Column(
          children: [
            Text('Uh oh... Nothing here!'),
            Text('Try selecting another category!'),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [],
      ),
      body: body,
    );
  }
}
