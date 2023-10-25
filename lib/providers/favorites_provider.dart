import 'package:first_flutter_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavMeal(Meal meal) {
    //check if meal is in the list of favorites
    final isFavorite = state.contains(meal);

    if (isFavorite) {
      //remove meal
      //meal is the meal pressed by the user
      //m is the meal that is already in the state
      //so we return all favorite meals except the one we pressed. Hence, we removed the meal which is already a favorite
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      //add meal
      state = [...state, meal];
      return true;
    }
  }
}

final favMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
