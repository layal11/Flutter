import 'package:first_flutter_app/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavoriteMeal});

  final Meal meal;
  final void Function(Meal meal) onToggleFavoriteMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => onToggleFavoriteMeal(meal),
            icon: const Icon(
              Icons.star,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(
              meal.imageUrl,
            ),
            fit: BoxFit.cover,
            height: 280,
            width: double.infinity,
          ),
          const SizedBox(height: 20),
          Text(
            'Ingredients',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 15),
          for (final ingredient in meal.ingredients)
            Column(
              children: [
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                ),
              ],
            ),
          const SizedBox(height: 20),
          Text(
            'Steps',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 15),
          for (final allSteps in meal.steps)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '- $allSteps',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
