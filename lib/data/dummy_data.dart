import 'package:flutter/material.dart';

import 'package:foodordering/models/category.dart';
import 'package:foodordering/models/meals.dart';

// Constants in Dart should be written in lowerCamelcase.
const availableCategories = [
  Category(
      id: 'c1',
      title: 'Italian',
      color: Colors.purple,
      imageUrl:
          'https://c.ndtvimg.com/2021-04/umk8i7ko_pasta_625x300_01_April_21.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886'
      //'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      ),
  Category(
    id: 'c2',
    title: 'Quick & Easy',
    color: Colors.red,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
  ),
  Category(
    id: 'c3',
    title: 'Hamburgers',
    color: Colors.orange,
    imageUrl:
        'https://static.onecms.io/wp-content/uploads/sites/19/2005/06/22/classic-burgers-u.jpg',
  ),
  Category(
    id: 'c4',
    title: 'German',
    color: Colors.amber,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
  ),
  Category(
    id: 'c5',
    title: 'Light & Lovely',
    color: Colors.blue,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
  ),
  Category(
    id: 'c6',
    title: 'Exotic',
    color: Colors.green,
    imageUrl: 'https://i.ytimg.com/vi/lrL-xvrRLAM/maxresdefault.jpg',
  ),
  Category(
    id: 'c7',
    title: 'Breakfast',
    color: Colors.lightBlue,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
  ),
  Category(
    id: 'c8',
    title: 'Asian',
    color: Colors.lightGreen,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
  ),
  Category(
    id: 'c9',
    title: 'French',
    color: Colors.pink,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
  ),
  Category(
    id: 'c10',
    title: 'Summer',
    color: Colors.teal,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
  ),
];

const dummyMeals = [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    videoUrl: "https://youtu.be/VKizSq2_ZNs",
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://www.archanaskitchen.com/images/archanaskitchen/10-Brands/DelMonte-KidsRecipes/Spaghetti_Pasta_Recipe_In_Creamy_Tomato_Sauce_-_Kids_Recipes_Made_With_Del_Monte-3.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      '1) Cut the tomatoes and the onion into small pieces.',
      '2) Boil some water - add salt to it once it boils.',
      '3) Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      '4) In the meantime, heaten up some olive oil and add the cut onion.',
      '5) After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      '6) The sauce will be done once the spaghetti are.',
      '7) Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c2',
    ],
    videoUrl: "https://youtu.be/4NN14mM3lI8",
    title: 'Toast Hawaii',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10,
    ingredients: [
      '1 Slice White Bread',
      '1 Slice Ham',
      '1 Slice Pineapple',
      '1-2 Slices of Cheese',
      'Butter'
    ],
    steps: [
      '1) Butter one side of the white bread',
      '2) Layer ham, the pineapple and cheese on the white bread',
      '3) Bake the toast for round about 10 minutes in the oven at 200°C'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c2',
      'c3',
    ],
    videoUrl: "https://youtu.be/hsF0pzZpXWY",
    title: 'Classic Hamburger',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl:
        'https://www.wjhl.com/wp-content/uploads/sites/98/2020/10/GettyImages-1149596729-1.jpg?w=2000&h=1440&crop=1',
    duration: 45,
    ingredients: [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns'
    ],
    steps: [
      '1) Form 2 patties',
      '2) Fry the patties for c. 4 minutes on each side',
      '3) Quickly fry the buns for c. 1 minute on each side',
      '4) Bruch buns with ketchup',
      '5) Serve burger with tomato, cucumber and onion'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm4',
    categories: [
      'c4',
    ],
    videoUrl: "https://youtu.be/0cqx3WWXJGs?si=y6oEdIQCttF1BO52",
    title: 'Wiener Schnitzel',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    duration: 60,
    ingredients: [
      '8 Veal Cutlets',
      '4 Eggs',
      '200g Bread Crumbs',
      '100g Flour',
      '300ml Butter',
      '100g Vegetable Oil',
      'Salt',
      'Lemon Slices'
    ],
    steps: [
      '1) Tenderize the veal to about 2–4mm, and salt on both sides.',
      '2) On a flat plate, stir the eggs briefly with a fork.',
      '3) Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
      '4) Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
      '5) Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.',
      '6) Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
      '7) Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    videoUrl: "https://youtu.be/yaP7MoCLHxc",
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    ingredients: [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper'
    ],
    steps: [
      '1) Wash and cut salad and herbs',
      '2) Dice the salmon',
      '3) Process mustard, vinegar and olive oil into a dessing',
      '4) Prepare the salad',
      '5) Add salmon cubes and dressing'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm6',
    categories: [
      'c6',
      'c10',
    ],
    videoUrl: "https://youtu.be/_qEHxncYR1w",
    title: 'Delicious Orange Mousse',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl: 'https://i.ytimg.com/vi/lrL-xvrRLAM/maxresdefault.jpg',
    duration: 240,
    ingredients: [
      '4 Sheets of Gelatine',
      '150ml Orange Juice',
      '80g Sugar',
      '300g Yoghurt',
      '200g Cream',
      'Orange Peel',
    ],
    steps: [
      '1) Dissolve gelatine in pot',
      '2) Add orange juice and sugar',
      '3) Take pot off the stove',
      '4) Add 2 tablespoons of yoghurt',
      '5) Stir gelatin under remaining yoghurt',
      '6) Cool everything down in the refrigerator',
      '7) Whip the cream and lift it under die orange mass',
      '8) Cool down again for at least 4 hours',
      '9) Serve with orange peel',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm7',
    categories: [
      'c7',
    ],
    videoUrl: "https://youtu.be/Pn15LITONhU",
    title: 'Pancakes',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
    duration: 20,
    ingredients: [
      '1 1/2 Cups all-purpose Flour',
      '3 1/2 Teaspoons Baking Powder',
      '1 Teaspoon Salt',
      '1 Tablespoon White Sugar',
      '1 1/4 cups Milk',
      '1 Egg',
      '3 Tablespoons Butter, melted',
    ],
    steps: [
      '1) In a large bowl, sift together the flour, baking powder, salt and sugar.',
      '2) Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      '3) Heat a lightly oiled griddle or frying pan over medium high heat.',
      '4) Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm8',
    categories: [
      'c8',
    ],
    videoUrl: "https://youtu.be/a03U45jFxOI",
    title: 'Creamy Indian Chicken Curry',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    duration: 35,
    ingredients: [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
    ],
    steps: [
      '1) Slice and fry the chicken breast',
      '2) Process onion, garlic and ginger into paste and sauté everything',
      '3) Add spices and stir fry',
      '4) Add chicken breast + 250ml of water and cook everything for 10 minutes',
      '5) Add coconut milk',
      '6) Serve with rice'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm9',
    categories: [
      'c9',
    ],
    videoUrl: "https://youtu.be/FWqfkUEWOTg",
    title: 'Chocolate Souffle',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
    duration: 45,
    ingredients: [
      '1 Teaspoon melted Butter',
      '2 Tablespoons white Sugar',
      '2 Ounces 70% dark Chocolate, broken into pieces',
      '1 Tablespoon Butter',
      '1 Tablespoon all-purpose Flour',
      '4 1/3 tablespoons cold Milk',
      '1 Pinch Salt',
      '1 Pinch Cayenne Pepper',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Cream of Tartar',
      '1 Tablespoon white Sugar',
    ],
    steps: [
      '1) Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      '2) Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      '3) Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      '4) Place chocolate pieces in a metal mixing bowl.',
      '5) Place bowl over a pan of about 3 cups hot water over low heat.',
      '6) Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      '7) Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      '8) Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      '9) Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      '10) Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      '11) Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      '12) whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      '13) Transfer a little less than half of egg whites to chocolate.',
      '14) Mix until egg whites are thoroughly incorporated into the chocolate.',
      '15) Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
      '16) Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
      '17) Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm10',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    videoUrl: "https://youtu.be/O--z_L2fEJk",
    title: 'Asparagus Salad with Cherry Tomatoes',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://recipe30.com/wp-content/uploads/2016/10/asparagus-salad.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      '1) Wash, peel and cut the asparagus',
      '2) Cook in salted water',
      '3) Salt and pepper the asparagus',
      '4) Roast the pine nuts',
      '5) Halve the tomatoes',
      '6) Mix with asparagus, salad and dressing',
      '7) Serve with Baguette'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
