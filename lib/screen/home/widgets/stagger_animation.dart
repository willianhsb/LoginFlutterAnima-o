// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'animated_list_view.dart';
import 'fade_container.dart';
import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({required this.controller})
      : containerGrow = CurvedAnimation(
    parent: controller,
    curve: Curves.ease,
  ),
        listSlidePosition = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 0),
          end: EdgeInsets.only(bottom: 80),
        ).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(
                  //porcentagem de tempo das animações
                  0.325, //32% de 2 segundos que é o tempo da animação.
                  0.8, //80% de 2 segundos que é o tempo da animação.
                  curve: Curves.ease,
                )
            )
        ),
        fadeAnimation = ColorTween(
            begin: Color.fromRGBO(28, 18, 98, 1.0,),
            end: Color.fromRGBO(28, 18, 98, 0.0,),
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.decelerate),
        );

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color?> fadeAnimation;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            HomeTop(
              containerGrow: containerGrow,
            ),
            AnimatedListView(
              listSlidePosition: listSlidePosition,
            ),
          ],
        ),
        IgnorePointer(
          child: FadeContainer(
            fadeAnimation: fadeAnimation,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: AnimatedBuilder(
            animation: controller,
            builder: _buildAnimation,
          )),
    );
  }
}
