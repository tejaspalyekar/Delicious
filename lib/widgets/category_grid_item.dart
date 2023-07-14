import 'package:flutter/material.dart';
import 'package:foodordering/models/category.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid(
      {super.key, required this.category, required this.onselect});
  final Category category;
  final void Function() onselect;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onselect,
        splashColor: const Color.fromARGB(255, 240, 211, 118),
        child: Stack(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(category.imageUrl!),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: const Color.fromARGB(103, 0, 0, 0),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
