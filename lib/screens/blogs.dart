import 'package:flutter/material.dart';

class blogs extends StatelessWidget {
  blogs({super.key, required this.apptitle});
  final String apptitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(apptitle),
        ),
        body: Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            child: Container(
              height: 200,
              width: double.infinity,
            )));
  }
}
