import 'package:flutter/material.dart';
import 'package:foodordering/models/meals.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({
    super.key,
    required this.meals,
    required this.ontoggle,
  });
  final Meal meals;
  final void Function(Meal meals) ontoggle;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  late YoutubePlayerController _controller;
  int count = 0;
  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.meals.videoUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meals.title),
        actions: [
          IconButton(
            onPressed: () {
              widget.ontoggle(widget.meals);
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
            /*Hero(
                tag: widget.meals.id,
                child: Image.network(widget.meals.videoUrl)),*/
            Hero(
              tag: widget.meals.id,
              child: Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.hardEdge,
                elevation: 3,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ),
            ),

            /*FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage()),*/
            const SizedBox(
              height: 20,
            ),
            Text(
              'Required Ingredients for making \n'
              '${widget.meals.title}'
              ' are',
              style: const TextStyle(
                  color: Color.fromARGB(255, 212, 78, 44),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: const Color.fromARGB(216, 219, 219, 219),
              child: Column(
                children: [
                  for (final ingredients in widget.meals.ingredients)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      child: Text(
                        ingredients,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                ],
              ),
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
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color.fromARGB(216, 219, 219, 219),
              child: Column(
                children: [
                  for (final steps in widget.meals.steps)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(steps,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
            /*for (final steps in widget.meals.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Text(steps,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.justify),
              ),*/
          ],
        ),
      ),
    );
  }
}
