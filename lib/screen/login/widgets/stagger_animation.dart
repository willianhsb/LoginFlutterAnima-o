// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {

   AnimationController controller;

  StaggerAnimation({required this.controller})
      : buttonAnimation = Tween(
          begin: 320.0,
          end: 60.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.150),
          ),
        ),
        buttonZoomOut = Tween(
          begin: 60.0,
          end: 1000.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1, curve: Curves.bounceOut),
          ),
        );

  final Animation<double> buttonAnimation;
  final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: buttonZoomOut.value <= 60
            ? Container(
                width: buttonAnimation.value,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    30,
                    20,
                    100,
                    1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: _buildInside(context),
              )
            : Container(
                width: buttonZoomOut.value,
                height: buttonZoomOut.value,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    30,
                    20,
                    100,
                    1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonAnimation.value > 75) {
      return Text(
        "Entrar",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
