// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter_animacao/screen/login/widgets/imput_fild.dart';

import '../../home/home_screen.dart';

class FormContainer extends StatefulWidget {
  const FormContainer({Key? key}) : super(key: key);

  @override
  State<FormContainer> createState() => _FormContainer();
}

class _FormContainer extends State<FormContainer> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        child: Column(
          children: <Widget>[
            InputFild(

              hint: "Nome de Usuário",
              obscure: false,
              icon: Icons.person_outline,
            ),
            InputFild(
              hint: "Senha",
              obscure: true,
              icon: Icons.lock_outline,
            ),
          ],
        ),
      ),
    );
  }

  login() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário não cadastrado!'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha inválida!'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
