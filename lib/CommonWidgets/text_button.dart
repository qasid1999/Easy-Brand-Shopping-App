import 'package:flutter/material.dart';

class BuildTextButton extends StatelessWidget {
  const BuildTextButton({
    Key? key,
    required this.text,
    required this.onpressed,
  }) : super(key: key);
  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
