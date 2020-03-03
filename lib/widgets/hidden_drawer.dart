import 'package:flutter/material.dart';
import 'package:foodi_app/models/meal.dart';
import 'package:foodi_app/screens/bottom_bar_screen.dart';
import 'package:foodi_app/screens/category_meal_screen.dart';
import 'package:foodi_app/screens/category_overview_screen.dart';
import 'package:foodi_app/screens/favourites_screen.dart';
import 'package:foodi_app/screens/filter_screen.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  final List<Meal> favouriteMeals;
  final Function setFilter;
  final Map<String, bool> currentFilters;
  HiddenDrawer(this.favouriteMeals, this.setFilter, this.currentFilters);
  @override
  _HiddenDrawerState createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> items = [];

  @override
  void initState() {
    // TODO: implement initState
    items.add(ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Meals",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orangeAccent,
        ),
        CategoryOverviewScreen()));
    items.add(ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Filters",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orangeAccent,
        ),
        FilterScreen(widget.setFilter, widget.currentFilters)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Theme.of(context).accentColor,
      backgroundColorAppBar: Theme.of(context).primaryColor,
      screens: items,
    );
  }
}
