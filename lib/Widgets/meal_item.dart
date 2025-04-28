import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectedMeal});
  final Meal meal;
  final Function(Meal meal) onSelectedMeal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectedMeal(meal),
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: Column(children: [
          Stack(children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl)),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: 300,
                color: Colors.black54,
                child: Text(
                  meal.title,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ]),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(" ${meal.duration.toString()} min")
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.work,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(" ${meal.complexityText}")
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(" ${meal.affordabilityText}")
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
