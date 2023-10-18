// import 'package:first_flutter_app/screens/tabs.dart';
// import 'package:first_flutter_app/widgets/main_darwer.dart';
import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersState();
}

class _FiltersState extends State<FiltersScreen> {
  bool toggleGlutenFree = false;
  bool toggleIsVegan = false;
  bool toggleIsVegetarian = false;
  bool toggleIsLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDarwer(
      //   onSelectDrawer: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (context) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            // key: value,
            Filter.glutenFree: toggleGlutenFree,
            Filter.lactoseFree: toggleIsLactoseFree,
            Filter.vegan: toggleIsVegan,
            Filter.vegetarian: toggleIsVegetarian,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: toggleGlutenFree,
              onChanged: (value) => setState(() {
                toggleGlutenFree = value;
              }),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 17, right: 17),
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes gluten-free meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            SwitchListTile(
              value: toggleIsVegan,
              onChanged: (value) => setState(() {
                toggleIsVegan = value;
              }),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 17, right: 17),
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes vegan meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            SwitchListTile(
              value: toggleIsVegetarian,
              onChanged: (value) => setState(() {
                toggleIsVegetarian = value;
              }),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 17, right: 17),
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes vegetarian meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            SwitchListTile(
              value: toggleIsLactoseFree,
              onChanged: (value) => setState(() {
                toggleIsLactoseFree = value;
              }),
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only includes Lactose-free meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
