import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodordering/widgets/textfield.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 131, 57, 0),
        Color.fromARGB(255, 131, 57, 0),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/Signin.png',
              width: 200, color: Color.fromARGB(131, 255, 255, 255)),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                ReuseabletextField(
                    text: "user name",
                    icon: Icons.person_3_sharp,
                    isPasswordType: false,
                    controller: username),
                const SizedBox(height: 20),
                ReuseabletextField(
                    text: "password",
                    icon: Icons.key,
                    isPasswordType: true,
                    controller: password)
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
