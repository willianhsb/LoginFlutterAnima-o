// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'list_data.dart';

class AnimatedListView extends StatelessWidget {


  final Animation <EdgeInsets> listSlidePosition;

  AnimatedListView({required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: "Estudar Flutter",
          subtitle: "Intrutor 1",
          image: AssetImage("images/perfil.jpg"),
          margin: listSlidePosition.value * 7,
        ),
        ListData(
          title: "Estudar Flutter",
          subtitle: "Intrutor 2",
          image: AssetImage("images/perfil.jpg"),
          margin: listSlidePosition.value * 6,
        ),
        ListData(
          title: "Estudar Flutter",
          subtitle: "Intrutor 3",
          image: AssetImage("images/perfil.jpg"),
          margin: listSlidePosition.value * 5,
        ),
        ListData(
          title: "Estudar Flutter",
          subtitle: "Intrutor 4",
          image: AssetImage("images/perfil.jpg"),
          margin: listSlidePosition.value * 4,
        ),
      ],
    );
  }
}
