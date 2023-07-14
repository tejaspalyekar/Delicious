import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Maindrawer extends StatelessWidget {
  const Maindrawer({super.key, required this.onselect});
  final void Function(String str) onselect;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Row(
            children: [
              Icon(
                Icons.food_bank_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 80,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Recipe App..",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 30,
                ),
              )
            ],
          )),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 30,
            ),
            title: const Text(
              "Meals",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              onselect("meals");
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: const Text(
              "Filter",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              onselect("filter");
            },
          ),
          ListTile(
            leading: const Icon(
              EvaIcons.book,
              size: 30,
            ),
            title: const Text(
              "Read Blogs",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              onselect("blogs");
            },
          )
        ],
      ),
    );
  }
}
