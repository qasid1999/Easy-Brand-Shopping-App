import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({Key? key, required this.onpressed, required this.text})
      : super(key: key);
  final VoidCallback onpressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 16,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        primary: Colors.orange,
        padding: const EdgeInsets.only(
          left: 110,
          right: 110,
        ),
      ),
      onPressed: onpressed,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10,
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
