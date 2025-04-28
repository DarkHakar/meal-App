import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Models/meal.dart';

class FavoriteMealsNotifire extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifire() : super([]);

  bool toggelMealFavoriteStatus(Meal meal) {
    var isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((el) => el.id != meal.id).toList();
      return false;
      //_showINfoMassege("Meal is no Longer Favorite");
    } else {
      state = [...state, meal];
      return true;

      //_showINfoMassege("Marked As a Favorite !");
    }
  }
}

final favoritemealsProvider =
    StateNotifierProvider<FavoriteMealsNotifire, List<Meal>>(
  (ref) {
    return FavoriteMealsNotifire();
  },
);
