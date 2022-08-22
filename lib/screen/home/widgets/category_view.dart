// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  final List<String> categories = [
    "Trabalho",
    "Estudo",
    "Mercado",
  ];

  int _category = 0;

  void selectNext(){
    setState(() {
      _category++;
    });
  }
  void selectBack(){
    setState(() {
      _category--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: _category > 0 ? selectBack : null,
          disabledColor: Colors.white30,
        ),
        Text(
          categories[_category].toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w300,
            color: Colors.white
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.white,
          disabledColor: Colors.white30,
          onPressed: _category < categories.length -1 ? selectNext : null,
        ),
      ],
    );
  }
}
