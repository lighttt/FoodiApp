import 'package:flutter/material.dart';
import 'package:foodi_app/dummy_data.dart';
import 'package:foodi_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String routeName = "/meal_screen";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            id: categoryMeals[i].id,
            title: categoryMeals[i].title,
            duration: categoryMeals[i].duration,
            imageUrl: categoryMeals[i].imageUrl,
            complexity: categoryMeals[i].complexity,
            affordability: categoryMeals[i].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
