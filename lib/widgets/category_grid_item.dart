// import 'package:first_flutter_app/main.dart';
import 'package:first_flutter_app/models/category.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: category.color,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: InkWell(
        onTap: onSelectCategory,
        splashColor: Theme.of(context).primaryColorDark, //visual tapping effect
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),

        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
            //style the font and the color of the text
          ),
        ),
      ),
    );
  }
}
