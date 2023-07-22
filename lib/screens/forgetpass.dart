import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/widgets/textfield.dart';

class ForgotPass extends StatelessWidget {
  ForgotPass({super.key});
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 131, 57, 0),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Password Reset Link Will be Send To Your Register Email Account Please Enter Valid Email Id",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              ReuseabletextField(
                  text: "Email Id",
                  icon: Icons.email,
                  isPasswordType: false,
                  controller: email),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(35),
                      backgroundColor:
                          const Color.fromARGB(202, 255, 255, 255)),
                  onPressed: () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email.text)
                        .then(
                      (value) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text(
                          "please check your gmail for password reset link",
                          style: TextStyle(fontSize: 15),
                        )));
                        Navigator.pop(context);
                      },
                    ).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid Email Id")));
                    });
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 131, 57, 0),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
