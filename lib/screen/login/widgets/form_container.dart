// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login_flutter_animacao/screen/login/widgets/imput_fild.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        child: Column(
          children: <Widget> [
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
}
