import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/Providers/meals_Provider.dart';

enum Filter { glutenfree, lactoseFree, veganFree, vegetarianfree }

class FilterNotifire extends StateNotifier<Map<Filter, bool>> {
  FilterNotifire()
      : super({
          Filter.glutenfree: false,
          Filter.lactoseFree: false,
          Filter.veganFree: false,
          Filter.vegetarianfree: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> newFilter) {
    state = newFilter;
  }
}

final filterProvider = StateNotifierProvider<FilterNotifire, Map<Filter, bool>>(
  (ref) => FilterNotifire(),
);

final filterMealProvider = Provider((ref) {
  final selectedFilter = ref.watch(filterProvider);
  final List<Meal> meals = ref.watch(mealsProvider);
  return meals.where((meal) {
    if (selectedFilter[Filter.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedFilter[Filter.veganFree]! && !meal.isVegan) {
      return false;
    }
    if (selectedFilter[Filter.vegetarianfree]! && !meal.isVegetarian) {
      return false;
    }

    return true;
  }).toList();
});
