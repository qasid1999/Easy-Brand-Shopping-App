import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    Key? key,
    required this.hintText,
    required this.isHidden,
    required this.prefixicon,
    required this.controller,
  }) : super(key: key);
  final String hintText;
  final bool isHidden;
  final IconData prefixicon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: TextField(
        controller: controller,
        obscureText: isHidden,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixicon,
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
