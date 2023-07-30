import 'package:flutter/material.dart';
import 'package:foodordering/models/meals.dart';
import 'package:foodordering/widgets/item_details.dart';
import 'package:foodordering/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class mealItem extends StatelessWidget {
  const mealItem({super.key, required this.meals, required this.ontoggle});
  final Meal meals;
  final void Function(Meal meal) ontoggle;
  String get complexity {
    return meals.complexity.name[0].toUpperCase() +
        meals.complexity.name.substring(1);
  }

  String get affordability {
    return meals.affordability.name[0].toUpperCase() +
        meals.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ItemDetails(meals: meals, ontoggle: ontoggle),
                ));
          },
          child: Stack(
            children: [
              Hero(
                tag: meals.id,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meals.imageUrl),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                          meals.title,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(
                                icon: Icons.access_time,
                                label: '${meals.duration}' 'mins'),
                            const SizedBox(width: 12),
                            MealItemTrait(icon: Icons.work, label: complexity),
                            const SizedBox(width: 15),
                            MealItemTrait(
                                icon: Icons.attach_money_rounded,
                                label: affordability),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
