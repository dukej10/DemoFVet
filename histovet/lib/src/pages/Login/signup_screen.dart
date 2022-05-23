import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:histovet/src/controller/sign_controller.dart';
import 'package:histovet/src/pages/Login/signin_screen.dart';
import 'package:histovet/src/pages/Login/utils/reusable_widget.dart';
import 'package:histovet/src/pages/Home/home_page.dart';

class SignUp extends StatefulWidget {
  static String id = "signup";
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignController sign = SignController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingrese usuario", Icons.person_outline,
                    false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingrese correo", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingrese contraseña", Icons.lock_outlined,
                    true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Registrarse", () {
                  messageSignUP(
                      _emailTextController.text, _passwordTextController.text);
                })
              ],
            ),
          ))),
    );
  }

  void messageSignUP(String correo, String password) async {
    bool answer = await sign.signUp(correo, password);
    if (answer) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se creo la cuenta con éxito"),
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
