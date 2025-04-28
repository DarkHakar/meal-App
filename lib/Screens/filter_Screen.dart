import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Providers/filter_Provider.dart';
// import 'package:meal_app/Screens/taps_Screen.dart';
// import 'package:meal_app/Widgets/main_Drawer.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Fliter'),
      ),
      body: Column(
        children: [
          CustomSwitch(context, "Gluten-Free", "Only Gluten Free Meals",
              selectedFilter[Filter.glutenfree]!, (bool value) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.glutenfree, value);
          }),
          CustomSwitch(context, "Lactose-Free", "Only Lactose Free Meals",
              selectedFilter[Filter.lactoseFree]!, (bool value) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.lactoseFree, value);
          }),
          CustomSwitch(context, "Vegan-Free", "Only Vegan Free Meals",
              selectedFilter[Filter.veganFree]!, (bool value) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.veganFree, value);
          }),
          CustomSwitch(context, "Vegetarian-Free", "Only Vegetarian Free Meals",
              selectedFilter[Filter.vegetarianfree]!, (bool value) {
            ref
                .read(filterProvider.notifier)
                .setFilter(Filter.vegetarianfree, value);
          }),
        ],
      ),
    );
  }

  SwitchListTile CustomSwitch(BuildContext context, String title,
      String subTitle, bool filter, Function(bool) onChanged) {
    return SwitchListTile(
        title: Text(title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary)),
        subtitle: Text(subTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary)),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 34, right: 22),
        value: filter,
        onChanged: onChanged);
  }
}
