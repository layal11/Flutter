import 'package:first_flutter_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:first_flutter_app/models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });
  final Meal meal;
  final Function(Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge, //force BorderRadius (because of the stack)
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        splashColor: Colors.red,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl), //url image
              fit: BoxFit.cover,
              //BoxFit.cover make sure that the image cut-off when it can't fit in the box
              height: 200,
              //add fixed height to make sure we don't have an ugly jump when clicking on the category
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      // softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const Spacer(),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const Spacer(),
                        MealItemTrait(
                          icon: Icons.money_off_rounded,
                          label: meal.affordability.name[0].toUpperCase() +
                              meal.affordability.name.substring(1),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
