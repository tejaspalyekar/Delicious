import 'package:flutter/material.dart';

enum Filter { glutenFree, lactosFree, vegetarian, vegan }

bool gstates = false;
bool lstates = false;
bool vegstates = false;
bool veganstates = false;

class Filters extends StatefulWidget {
  const Filters({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return FilterState();
  }
}

class FilterState extends State<Filters> {
  void cstate(value, String filter) {
    if (filter == "gluteen") {
      gstates = value;
    } else if (filter == "lactos") {
      lstates = value;
    } else if (filter == "veg") {
      vegstates = value;
    } else {
      veganstates = value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({
          Filter.glutenFree: gstates,
          Filter.lactosFree: lstates,
          Filter.vegetarian: vegstates,
          Filter.vegan: veganstates,
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Filter",
          ),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: gstates,
              onChanged: (value) => cstate(value, "gluteen"),
              title: Text("Gluteen Free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              subtitle: Text("Only include Glutten free meals",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
            ),
            SwitchListTile(
              value: lstates,
              onChanged: (value) => cstate(value, "lactos"),
              title: Text("Lactos Free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              subtitle: Text("Only include Lactos free meals",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
            ),
            SwitchListTile(
              value: vegstates,
              onChanged: (value) => cstate(value, "veg"),
              title: Text("Vegeterian",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              subtitle: Text("Only include Vegeterian meals",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
            ),
            SwitchListTile(
              value: veganstates,
              onChanged: (value) => cstate(value, "vegan"),
              title: Text("Vegan",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              subtitle: Text("Only include Vegan meals",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
