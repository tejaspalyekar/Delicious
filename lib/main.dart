import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          elevation: 5,
          centerTitle: true,
          title: const Text("IndiaEat",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              )),
        ),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2),
            children: [
              Container(
                  color: Colors.white,
                  child: const Text(
                    "1",
                  )),
              Container(
                  color: Colors.white,
                  child: const Text(
                    "2",
                  )),
              Container(
                  color: Colors.white,
                  child: const Text(
                    "3",
                  )),
              Container(
                  color: Colors.white,
                  child: const Text(
                    "4",
                  )),
            ]),
      ),
    );
  }
}
