import 'package:first_flutter_app/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FilterMealsNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterMealsNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilter(Filter filter, bool isActive) {
    //to update only one filter
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final fltrsProvider =
    StateNotifierProvider<FilterMealsNotifier, Map<Filter, bool>>((ref) {
  return FilterMealsNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider); //dummyMeals

  final fltrProviderData = ref.watch(fltrsProvider);
  //the return method is executed whenever the watched value changes

  return meals.where((meal) {
    if ((fltrProviderData[Filter.glutenFree]! && meal.isGlutenFree == false) ||
        (fltrProviderData[Filter.lactoseFree]! && meal.isLactoseFree == false) ||
        (fltrProviderData[Filter.vegan]! && !meal.isVegan == false) ||
        (fltrProviderData[Filter.vegetarian]! && !meal.isVegetarian == false)) {
      return false;
    }
    return true;
  }).toList();
});
