import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:histovet/src/pages/Login/reset_password.dart';
import 'package:histovet/src/pages/Login/signup_screen.dart';
import 'package:histovet/src/pages/Login/utils/reusable_widget.dart';
import 'package:histovet/src/pages/Home/home_page.dart';

import '../../controller/sign_controller.dart';

class SignIn extends StatefulWidget {
  static String id = "signin";
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  SignController sign = SignController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                Text(
                  "HistoVet",
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = Colors.black,
                  ),
                ),
                logoWidget("assets/img/vet.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Ingrese correo", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingrese contraseña", Icons.lock_outline,
                    true, _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Iniciar sesión", () {
                  messageSign(
                      _emailTextController.text, _passwordTextController.text);
                  ;
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No tiene cuenta?", style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            " Registrarse",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Olvidó la contraseña?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }

  void messageSign(String correo, String password) async {
    bool answer = await sign.signIn(correo, password);
    if (answer) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se inicio sesión"),
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
