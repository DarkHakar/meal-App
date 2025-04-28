import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/Widgets/gride_view_Item.dart';
import 'package:meal_app/data/dummy_data%20(1).dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.avaliblemeal});

  final List<Meal> avaliblemeal;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: const Duration(seconds: 1));
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 4 / 3),
          children: [
            for (final category in availableCategories)
              GrideViewItem(
                category: category,
                avaliblemeal: widget.avaliblemeal,
              )
          ],
        ),
        builder: (ctx, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(
              parent: _controller, curve: Curves.easeInOutQuart)),
          child: child,
        ),
      ),
    );
  }
}
