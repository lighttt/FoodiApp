import 'package:flutter/material.dart';
import 'package:foodi_app/models/meal.dart';
import 'package:foodi_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = "/meal_screen";
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;

  // ------------- didChangeDependencies is used because ------------
  // ------------ context is returned only after initState --------
  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    categoryMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
