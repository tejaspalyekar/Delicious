import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    Widget screen = const CategoryScreen();
    String title = "IndiaEat";
    if (idx == 1) {
      screen = const MealScreen(meal: []);
      title = "Your Favourit";
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
