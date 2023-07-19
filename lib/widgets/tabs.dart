import 'package:flutter/material.dart';
import 'package:foodordering/data/dummy_data.dart';
import 'package:foodordering/models/meals.dart';
import 'package:foodordering/screens/blogs.dart';
import 'package:foodordering/screens/categories.dart';
import 'package:foodordering/screens/filter.dart';
import 'package:foodordering/screens/meal.dart';
import 'package:foodordering/widgets/main_drawer.dart';
import 'package:foodordering/widgets/meal_item.dart';
import 'package:google_fonts/google_fonts.dart';

Map<Filter, bool> kselectedFilters = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

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
  Map<Filter, bool> selectedFilters = kselectedFilters;

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

  void onselect(String str) async {
    Navigator.pop(context);
    if (str == "filter") {
      final filterdata =
          await Navigator.of(context).push<Map<Filter, bool>>(DialogRoute(
        context: context,
        builder: (context) => const Filters(),
      ));
      setState(() {
        selectedFilters = filterdata ?? selectedFilters;
      });
    } else if (str == "blogs") {
      Navigator.of(context).push(DialogRoute(
        context: context,
        builder: (context) => blogs(apptitle: str),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availmeals = dummyMeals.where((element) {
      if (selectedFilters[Filter.glutenFree]! && !element.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactosFree]! && !element.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !element.isVegan) {
        return false;
      }
      if (selectedFilters[Filter.vegetarian]! && !element.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget screen = CategoryScreen(
      availableMeals: availmeals,
      ontoggle: ontoggle,
    );
    String title = "Delicious";
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
      drawer: Maindrawer(onselect: onselect),
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
