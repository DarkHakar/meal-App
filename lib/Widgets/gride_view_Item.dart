import 'package:flutter/material.dart';
import 'package:meal_app/Models/category.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/Screens/meals_Screen.dart';

class GrideViewItem extends StatelessWidget {
  const GrideViewItem({
    super.key,
    required this.category,
    required this.avaliblemeal,
  });
  final Category category;
  final List<Meal> avaliblemeal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final filterdMeal = avaliblemeal
            .where((meal) => meal.categories.contains(category.id))
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: category.title,
                  meal: filterdMeal,
                )));
      },
      splashColor: Theme.of(context).colorScheme.onPrimaryContainer,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [
                category.color.withOpacity(0.54),
                category.color.withOpacity(0.9),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          )),
    );
  }
}
