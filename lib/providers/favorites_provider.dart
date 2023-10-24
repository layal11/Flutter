import 'package:first_flutter_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleFavMeal(Meal meal) {
    final isFavorite = state.contains(meal);
    if (isFavorite) {
      //remove meal
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      //add meal
      state = [...state, meal];
    }
  }
}

final favMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
