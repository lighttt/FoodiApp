import 'package:flutter/material.dart';
import 'package:foodi_app/models/meal.dart';
import 'package:foodi_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return MealItem(
          id: favouriteMeals[i].id,
          title: favouriteMeals[i].title,
          duration: favouriteMeals[i].duration,
          imageUrl: favouriteMeals[i].imageUrl,
          complexity: favouriteMeals[i].complexity,
          affordability: favouriteMeals[i].affordability,
        );
      },
      itemCount: favouriteMeals.length,
    );
  }
}
