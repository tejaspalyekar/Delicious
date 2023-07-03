import 'package:flutter/material.dart';
import 'package:foodordering/models/category.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid(
      {super.key, required this.category, required this.onselect});
  final Category category;
  final void Function() onselect;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselect,
      splashColor: const Color.fromARGB(255, 240, 211, 118),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: const Color.fromARGB(255, 53, 20, 2)),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
