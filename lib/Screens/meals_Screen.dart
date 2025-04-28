import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/Screens/meal_Details.dart';
import 'package:meal_app/Widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meal,
  });

  final String? title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.pinkAccent,
              centerTitle: true,
              title: Text(title!),
            ),
            body: content(context));
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meal
            .map((meal) => MealItem(
                  meal: meal,
                  onSelectedMeal: (Meal meal) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => MealDetails(
                              meal: meal,
                            )));
                  },
                ))
            .toList(),
      ),
    );
  }
}
