import 'package:flutter/material.dart';
import 'package:foodordering/data/dummy_data.dart';
import 'package:foodordering/models/category.dart';
import 'package:foodordering/widgets/category_grid_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodordering/screens/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void onclick(BuildContext context, Category category) {
    final current = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealScreen(
                  meal: current,
                  title: category.title,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
              width: double.infinity,
              height: 260,
              child: Image(image: AssetImage('assets/header.jpg'))),
          SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "What's in your mind?",
                  style: GoogleFonts.niramit(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w600),
                ),
              )),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: GridView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 0.6,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                for (final category in availableCategories)
                  CategoryGrid(
                      category: category,
                      onselect: () => onclick(context, category))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
