// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:login_flutter_animacao/screen/home/widgets/form_container.dart';

class SignUpButtom extends StatelessWidget {
  const SignUpButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 160),
      onPressed: () {
        login();
      },
      child: Text(
        "Não possui uma conta? Cadastre-se.",
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.white,
          fontSize: 15,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}


