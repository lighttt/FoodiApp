import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
//  final String title;
//  CategoryMealScreen(this.title);

  static const String routeName = "/meal_screen";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final title = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
