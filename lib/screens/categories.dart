import 'package:flutter/material.dart';
import 'package:foodordering/data/dummy_data.dart';
import 'package:foodordering/widgets/category_grid_item.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          centerTitle: true,
          title: Text("IndiaEat", GoogleFonts()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                  width: double.infinity,
                  height: 260,
                  child: Image(image: AssetImage('assets/header.jpg'))),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: GridView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 1 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  children: [
                    for (final category in availableCategories)
                      CategoryGrid(category: category)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
