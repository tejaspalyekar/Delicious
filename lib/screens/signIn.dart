import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/screens/forgetpass.dart';
import 'package:foodordering/screens/signUp.dart';
import 'package:foodordering/widgets/tabs.dart';
import 'package:foodordering/widgets/textfield.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final List<String> fav = ["fav"];
  late DatabaseReference dbref;
  String mob = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 131, 57, 0),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/Signin.png',
              width: 200, color: const Color.fromARGB(131, 255, 255, 255)),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                ReuseabletextField(
                    text: "user name",
                    icon: Icons.person_3_sharp,
                    isPasswordType: false,
                    controller: email),
                const SizedBox(height: 20),
                ReuseabletextField(
                    text: "password",
                    icon: Icons.key,
                    isPasswordType: true,
                    controller: password),
                const SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPass(),
                            ));
                      },
                      child: const Text(
                        "forgot password?",
                      )),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email.text, password: password.text)
                          .then((value) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("login Sucessful")));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Tabs(),
                            ));
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Unable to login")));
                      });
                    },
                    icon: const Icon(
                      Icons.navigate_next,
                      color: Color.fromARGB(255, 131, 57, 0),
                    ),
                    label: const Text("LOGIN",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 131, 57, 0))),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                        backgroundColor:
                            const Color.fromARGB(213, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have account?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Map db = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                        String no = db["mob"];
                        dbref =
                            FirebaseDatabase.instance.ref().child("$no/data");
                        dbref.push().set(db);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Tabs(),
                            ));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
