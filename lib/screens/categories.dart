import 'package:flutter/material.dart';
import 'package:foodordering/data/dummy_data.dart';
import 'package:foodordering/models/category.dart';
import 'package:foodordering/models/meals.dart';
import 'package:foodordering/widgets/category_grid_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodordering/screens/meal.dart';

import '../widgets/textfield.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen(
      {super.key, required this.ontoggle, required this.availableMeals});
  final void Function(Meal meal) ontoggle;
  final List<Meal> availableMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationcontroller;
  TextEditingController search = TextEditingController();
  late Image image;

  @override
  void initState() {
    _animationcontroller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
        upperBound: 1,
        lowerBound: 0);
    super.initState();
    _animationcontroller.forward();
    image = Image.asset("assets/header.jpg");
  }

  @override
  void didChangeDependencies() {
    precacheImage(image.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationcontroller.dispose();
    super.dispose();
  }

  void onclick(BuildContext context, Category category) {
    final current = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealScreen(
                  meal: current,
                  title: category.title,
                  ontoggle: widget.ontoggle,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: search,
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255)
                      .withOpacity(0.9)),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                labelText: "search here",
                labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255)
                        .withOpacity(0.9)),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor:
                    const Color.fromARGB(249, 250, 250, 250).withOpacity(0.11),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none)),
              ),
            ),
            SizedBox(width: double.infinity, height: 240, child: image),
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
            AnimatedBuilder(
                animation: _animationcontroller,
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: GridView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(5),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Roll the Dice for Your Next Delight!",
                      style: GoogleFonts.niramit(
                          fontSize: 21,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                        margin: const EdgeInsets.all(11),
                        color: Color.fromARGB(146, 26, 13, 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.hardEdge,
                        elevation: 3,
                        child: Image.asset("assets/dice.png"))
                  ],
                ),
                builder: (context, child) => SlideTransition(
                      position: Tween(
                              begin: const Offset(0, 0.3),
                              end: const Offset(0, 0))
                          .animate(CurvedAnimation(
                              parent: _animationcontroller,
                              curve: Curves.bounceInOut)),
                      child: child,
                    )),
          ],
        ),
      ),
    ));
  }
}
