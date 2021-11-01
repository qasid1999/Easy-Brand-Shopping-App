import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/CommonWidgets/container.dart';
import 'package:shopping_app/CommonWidgets/eleveted_button.dart';
import 'package:shopping_app/CommonWidgets/text_button.dart';
import 'package:shopping_app/CommonWidgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/Screens/AuthScreens/lognin_screen.dart';
import 'package:shopping_app/Screens/cart_screen.dart';
import 'package:shopping_app/Screens/home_screen.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({Key? key}) : super(key: key);

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController usernamecontroller = TextEditingController();

  Future buildalertDailog(String error, BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(
            error,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }

  bool flag = false;

  register(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore database = FirebaseFirestore.instance;
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    String username = usernamecontroller.text;
    try {
      final UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      database.collection("users").add(
        {
          "email": email,
          "username": username,
        },
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomScreen();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        buildalertDailog(
          "The Password Provided is too weak.",
          context,
        );
      } else if (e.code == 'email-already-in-use') {
        buildalertDailog(
          "The email is already in used.",
          context,
        );
      } else {
        buildalertDailog(e.code, context);
      }
    } catch (e) {
      buildalertDailog(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BuildContainer(
                icon: Icons.person_add_alt_rounded,
                text: "Register",
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 500,
                width: 330,
                child: Column(
                  children: [
                    BuildTextField(
                      hintText: "Email",
                      isHidden: false,
                      prefixicon: Icons.email,
                      controller: emailcontroller,
                    ),
                    BuildTextField(
                      hintText: "User",
                      isHidden: false,
                      prefixicon: Icons.email,
                      controller: usernamecontroller,
                    ),
                    BuildTextField(
                      hintText: "Password",
                      isHidden: true,
                      prefixicon: Icons.lock,
                      controller: passwordcontroller,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    BuildButton(
                      onpressed: () {
                        register(context);
                      },
                      text: "Register",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    BuildTextButton(
                      text: "Already Account? Sign in",
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LogInScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
