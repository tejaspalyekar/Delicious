import 'package:flutter/material.dart';
import 'package:foodordering/models/meals.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({
    super.key,
    required this.meals,
    required this.ontoggle,
  });
  final Meal meals;
  final void Function(Meal meals) ontoggle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meals.title),
        actions: [
          IconButton(
            onPressed: () {
              ontoggle(meals);
            },
            icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
                child: const Icon(
                  Icons.star, /*key: ValueKey(),*/
                )),
            color: Colors.amber,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag: meals.id, child: Image.network(meals.imageUrl)),
            /*FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage()),*/
            const SizedBox(
              height: 20,
            ),
            Text(
              'Required Ingredients for making \n' '${meals.title}' ' are',
              style: const TextStyle(
                  color: Color.fromARGB(255, 212, 78, 44),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            for (final ingredients in meals.ingredients)
              Text(
                ingredients,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Steps:',
              style: TextStyle(
                  color: Color.fromARGB(255, 212, 78, 44),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            for (final steps in meals.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  steps,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
