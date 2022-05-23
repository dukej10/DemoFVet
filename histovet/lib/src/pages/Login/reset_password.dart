import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:histovet/src/controller/sign_controller.dart';
import 'package:histovet/src/pages/Login/signin_screen.dart';
import 'package:histovet/src/pages/Login/utils/color_utils.dart';
import 'package:histovet/src//pages/Login/utils/reusable_widget.dart';

class ResetPassword extends StatefulWidget {
  static String id = "reset";
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  SignController sign = SignController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Reset Password", () {
                  messageReset(_emailTextController.text);
                })
              ],
            ),
          ))),
    );
  }

  void messageReset(String correo) async {
    bool answer = await sign.reset(correo);
    if (answer) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Revise su correo"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Revise sus datos"),
        backgroundColor: Colors.green,
      ));
    }
  }
}
