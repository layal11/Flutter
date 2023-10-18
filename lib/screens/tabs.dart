import 'package:first_flutter_app/models/meal.dart';
import 'package:first_flutter_app/screens/categories.dart';
import 'package:first_flutter_app/screens/filters.dart';
import 'package:first_flutter_app/screens/meals.dart';
import 'package:first_flutter_app/widgets/main_darwer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  createState() => _ScreensState();
}

class _ScreensState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> favoriteMeals = [];

  void selectDrawer(String idntfr) async {
    if (idntfr == 'meals') {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
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

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void toggleFavoriteMeal(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      showInfoMessage('Meal is no longer a favorite.');
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
      showInfoMessage('Meal added to favorites!');
    }
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      onToggleFavoriteMeal: toggleFavoriteMeal,
    );
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: favoriteMeals,
        onToggleFavoriteMeal: toggleFavoriteMeal,
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
