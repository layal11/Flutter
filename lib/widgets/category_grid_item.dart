// import 'package:first_flutter_app/main.dart';
import 'package:first_flutter_app/models/category.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: category.color,
      child: Text(
        category.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
        //or we can style it just like this
        //style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
