import 'package:first_flutter_app/data/dummy_data.dart';
import 'package:first_flutter_app/screens/meals.dart';
import 'package:first_flutter_app/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          meals: [],
          title: 'test title',
        ),
      ),
    );
    //but we have to add (BuildContext context) as a parameter to the function
    // Navigator.push(context, MaterialPageRoute(builder: (){} ),);
  }

  @override
  Widget build(BuildContext context) {
    const String appBarTitle = 'Pick your category';
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: GridView(
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
              onSelectCategory: () => selectCategory(context),
            ),
        ],
      ),
    );
  }
}
