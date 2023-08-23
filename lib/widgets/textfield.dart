import 'package:flutter/material.dart';

class ReuseabletextField extends StatefulWidget {
  ReuseabletextField(
      {super.key,
      required this.text,
      required this.icon,
      required this.isPasswordType,
      required this.controller});
  String text;
  IconData icon;
  bool isPasswordType;
  TextEditingController controller;
  @override
  State<ReuseabletextField> createState() => _ReuseabletextFieldState();
}

class _ReuseabletextFieldState extends State<ReuseabletextField> {
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPasswordType ? pass : false,
      enableSuggestions: !widget.isPasswordType,
      autocorrect: !widget.isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: Colors.white70),
        suffixIcon: widget.isPasswordType
            ? IconButton(
                onPressed: () {
                  pass = pass ? false : true;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                ))
            : const Text(""),
        labelText: widget.text,
        labelStyle: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(146, 255, 255, 255).withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}
