import 'package:flutter/material.dart';
import 'package:foodi_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter_screen';
  final Function setFilter;
  final Map<String, bool> currentFilters;
  FilterScreen(this.setFilter, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final filterData = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.setFilter(filterData);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Adjust your filters here!',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    'Gluten Free',
                    'Only Gluten Free meals are selected',
                    _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _buildSwitchListTile(
                    'Latcose Free',
                    'Only lactose Free meals are selected',
                    _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only Vegan meals are selected', _vegan, (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                _buildSwitchListTile(
                    'Vegeterain',
                    'Only  Vegeterain meals are selected',
                    _vegetarian, (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
