import 'package:flutter/material.dart';
import 'package:foodordering/main.dart';
import 'package:foodordering/models/meals.dart';
import 'package:foodordering/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {super.key, this.title, required this.meal, required this.ontoggle});
  final String? title;
  final List<Meal> meal;
  final void Function(Meal meal) ontoggle;
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (context, index) => mealItem(
              meals: meal[index],
              ontoggle: ontoggle,
            ));
    if (meal.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "No Contents Available...",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onBackground, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Try sellecting different category",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onBackground, fontSize: 15),
            ),
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
