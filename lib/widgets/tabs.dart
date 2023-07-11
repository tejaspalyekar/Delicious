import 'package:flutter/material.dart';
import 'package:foodordering/models/meals.dart';
import 'package:foodordering/screens/categories.dart';
import 'package:foodordering/screens/meal.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<StatefulWidget> createState() {
    return TabScreeen();
  }
}

class TabScreeen extends State<Tabs> {
  int idx = 0;
  void currentScreen(int n) {
    setState(() {
      idx = n;
    });
  }

  final List<Meal> fav = [];

  void toast(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      showCloseIcon: true,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: const Color.fromARGB(255, 214, 214, 214),
    ));
  }

  void ontoggle(Meal meal) {
    final check = fav.contains(meal);
    setState(() {
      if (check) {
        fav.remove(meal);
        toast("${meal.title} removed from favourite");
      } else {
        fav.add(meal);
        toast("${meal.title} Added to favourite");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = CategoryScreen(
      ontoggle: ontoggle,
    );
    String title = "IndiaEat";
    if (idx == 1) {
      screen = MealScreen(
        meal: fav,
        ontoggle: ontoggle,
      );
      title = "Your Favourits";
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(title,
            style: idx == 0
                ? GoogleFonts.bevan(
                    fontSize: 40,
                  )
                : const TextStyle(fontSize: 25)),
      ),
      body: screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
        onTap: (value) {
          currentScreen(value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_rounded), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined), label: 'Favourite')
        ],
      ),
    );
  }
}
