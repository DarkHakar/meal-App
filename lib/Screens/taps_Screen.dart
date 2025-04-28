import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/Providers/favorite_Provider.dart';
import 'package:meal_app/Providers/filter_Provider.dart';
import 'package:meal_app/Providers/navbar_Provider.dart';
import 'package:meal_app/Screens/category_Screen.dart';
import 'package:meal_app/Screens/filter_Screen.dart';
import 'package:meal_app/Screens/meals_Screen.dart';
import 'package:meal_app/Widgets/main_Drawer.dart';

class TapsScreen extends ConsumerWidget {
  const TapsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avaliblemeal = ref.watch(filterMealProvider);
    final int selctedPageIndex = ref.watch(navbarProvider);
    Widget activeScreen = CategoryScreen(
      avaliblemeal: avaliblemeal,
    );
    var activePagetitel = "Categories";

    if (selctedPageIndex == 1) {
      final List<Meal> favoriteMeal = ref.watch(favoritemealsProvider);
      activeScreen = MealsScreen(
        meal: favoriteMeal,
      );
      activePagetitel = 'Favorites';
    }

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(
        setScreen: (String screen) {
          if (screen == "Filter") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const FilterScreen()));
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 183, 45, 91),
        title: Text(activePagetitel),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 89, 42, 66),
          onTap: ref.read(navbarProvider.notifier).selectPage,
          currentIndex: selctedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
      body: activeScreen,
    );
  }
}
