// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.setScreen,
  });

  final void Function(String screen) setScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 132, 47, 104),
                Color.fromARGB(255, 245, 44, 131),
              ])),
              child: Row(
                children: [
                  const Icon(
                    Icons.fastfood,
                    size: 48,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text("Coocking Up.. ",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary))
                ],
              )),
          ListTile(
            onTap: () {
              setScreen("Meal");
            },
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text("Meals",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
          ),
          ListTile(
            onTap: () {
              setScreen("Filter");
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text("Filters",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
          )
        ],
      ),
    );
  }
}
