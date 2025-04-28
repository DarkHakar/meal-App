import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/Providers/favorite_Provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> favoriteMeals = ref.watch(favoritemealsProvider);
    final bool isFavourite = favoriteMeals.contains(meal);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoritemealsProvider.notifier)
                  .toggelMealFavoriteStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(wasAdded
                      ? "Marked as Favorite"
                      : "Meal is no Longer Favoraite")));
            },
            icon: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                    child: child,
                  );
                },
                child: Icon(isFavourite ? Icons.star : Icons.star_border)),
            color: Colors.yellow,
          )
        ],
        title: Text(
          meal.title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Ingredients",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            for (final ingrediants in meal.ingredients)
              Text(
                ingrediants,
                textAlign: TextAlign.end,
                style: const TextStyle(color: Colors.black87),
              ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Steps",
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
            const SizedBox(
              height: 15,
            ),
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black87, fontSize: 15),
                ),
              )
          ],
        ),
      ),
    );
  }
}
