import 'package:flutter/material.dart';

class MobileProductScreen extends StatefulWidget {
  const MobileProductScreen({Key? key}) : super(key: key);

  @override
  _MobileProductScreenState createState() => _MobileProductScreenState();
}

class _MobileProductScreenState extends State<MobileProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Commin Soon")),
    );
  }
}
