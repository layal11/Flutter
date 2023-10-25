import 'package:first_flutter_app/data/dummy_data.dart';
import 'package:first_flutter_app/models/category.dart';
import 'package:first_flutter_app/models/meal.dart';
import 'package:first_flutter_app/screens/meals.dart';
import 'package:first_flutter_app/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.availableMeals});

  final List<Meal> availableMeals;

  void selectCategory(BuildContext context, Category category) {
    final filteredMeal = availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          meals: filteredMeal,
          title: category.title,
        ),
      ),
    );
    //Navigator.of(context).push(MaterialPageRoute(...))
    //is same as
    //Navigator.push(context, MaterialPageRoute(builder: (){} ),);
    //but we have to add (BuildContext context) as a parameter to the function
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.only(left: 10, right: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),

      //using .map(...)
      // children: availableCategories
      //     .map((category) => CategoryGridItem(category: category))
      //     .toList(),

      //or using for(...) loop
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () => selectCategory(context, category),
          ),
      ],
    );
  }
}
