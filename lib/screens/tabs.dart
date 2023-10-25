import 'package:first_flutter_app/providers/favorites_provider.dart';
import 'package:first_flutter_app/providers/meals_provider.dart';
import 'package:first_flutter_app/screens/categories.dart';
import 'package:first_flutter_app/screens/filters.dart';
import 'package:first_flutter_app/screens/meals.dart';
import 'package:first_flutter_app/widgets/main_darwer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//global variable/constant
const kDefaultFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  createState() => _ScreensState();
}

class _ScreensState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;
  Map<Filter, bool> selectedFilters = kDefaultFilters;

  void selectDrawer(String idntfr) async {
    if (idntfr == 'meals') {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            currentFilters: selectedFilters,
          ),
        ),
      );
      setState(() {
        //?? means "if null"
        selectedFilters = result ?? kDefaultFilters;
      });
      print(result);
    }
  }

  // //SECOND WAY
  // void selectDrawer(String idntfr) async {
  //   Navigator.of(context).pop();
  //   if (idntfr == 'filters') {
  //     final result = await Navigator.of(context).push<Map<Filter, bool>>(
  //       MaterialPageRoute(
  //         builder: (ctx) => const FiltersScreen(),
  //       ),
  //     );
  //     print(result);
  //   }
  // }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // similar to widget property
    // ref allows us to setup listeners to our providers
    final meals = ref.watch(mealsProvider);

    final avlblFilteredMeals = meals.where((meal) {
      if ((selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) ||
          (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) ||
          (selectedFilters[Filter.vegan]! && !meal.isVegan) ||
          (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian)) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
      availableMeals: avlblFilteredMeals,
    );
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favMealsProvider);
      activeScreen = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDarwer(onSelectDrawer: selectDrawer),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
