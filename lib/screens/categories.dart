import 'package:first_flutter_app/data/dummy_data.dart';
import 'package:first_flutter_app/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
            CategoryGridItem(category: category),
        ],
      ),
    );
  }
}
