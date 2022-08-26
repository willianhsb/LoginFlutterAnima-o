// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class FadeContainer extends StatelessWidget {

  final Animation<Color?> fadeAnimation;

  FadeContainer ({required this.fadeAnimation});


  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "fade",
      child: Container(
        decoration: BoxDecoration(
          color: fadeAnimation.value,
        ),
      ),

    );
  }
}
