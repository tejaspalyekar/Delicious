import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/widgets/textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  late DatabaseReference dbref;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 25),
          ),
          //backgroundColor: const Color.fromARGB(255, 109, 48, 2),
        ),
        // backgroundColor: const Color.fromARGB(255, 131, 57, 0),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                ReuseabletextField(
                    text: "Enter User Name",
                    icon: Icons.person,
                    isPasswordType: false,
                    controller: username),
                const SizedBox(height: 20),
                ReuseabletextField(
                    text: "Enter Email Id",
                    icon: Icons.email,
                    isPasswordType: false,
                    controller: email),
                const SizedBox(height: 20),
                ReuseabletextField(
                    text: "Enter Mobile No",
                    icon: Icons.phone,
                    isPasswordType: false,
                    controller: phone),
                const SizedBox(height: 20),
                ReuseabletextField(
                    text: "Enter Password",
                    icon: Icons.password,
                    isPasswordType: false,
                    controller: password),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(197, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: const Size.fromHeight(40)),
                  onPressed: () {
                    String email1 = email.text;
                    String pass = password.text;
                    String phone1 = phone.text;
                    String username1 = username.text;
                    Map<String, String> userdata = {
                      "mob": phone1,
                      "name": username1,
                      "email": email1,
                    };
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email1, password: pass)
                        .then(
                      (value) {
                        Navigator.of(context).pop(userdata);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Sign up Sucessfull")));
                      },
                    ).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Enter Valid User Data")));
                    });
                  },
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                        color: Color.fromARGB(255, 131, 57, 0), fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
