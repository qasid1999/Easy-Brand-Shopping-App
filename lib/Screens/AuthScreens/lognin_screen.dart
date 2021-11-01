import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/CommonWidgets/container.dart';
import 'package:shopping_app/CommonWidgets/eleveted_button.dart';
import 'package:shopping_app/CommonWidgets/text_button.dart';
import 'package:shopping_app/CommonWidgets/text_field.dart';
import 'package:shopping_app/Screens/AuthScreens/register_user_screen.dart';
import 'package:shopping_app/Screens/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

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

  Future<void> signinwithemail(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
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
      if (e.code == 'user-not-found') {
        buildalertDailog(
          'No user found for that email',
          context,
        );
      } else if (e.code == 'wrong-password') {
        buildalertDailog(
          "Wrong password provided for that user.",
          context,
        );
      } else if (e.code == 'network-request-failed') {
        buildalertDailog(
          "Network connection Error.Please connect your device with internet",
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
                icon: Icons.person,
                text: "Login",
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 380,
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
                      hintText: "Password",
                      isHidden: true,
                      prefixicon: Icons.lock,
                      controller: passwordcontroller,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        BuildTextButton(
                          text: "Forgot Password",
                          onpressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BuildButton(
                      onpressed: () {
                        signinwithemail(context);
                      },
                      text: "Login",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextButton(
                      text: "No account? Register",
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const RegisterUserScreen();
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
