import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';

  final Map<String, bool> currentFilter;
  final Function saveFilter;
  FilterScreen(this.currentFilter, this.saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lcatoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lcatoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
      value: currentValue,
    );
  }

  void _toggleFilter() {
    final selectedFilter = {
      'gluten': _glutenFree,
      'vegetarian': _vegetarian,
      'vegan': _vegan,
      'lactose': _lcatoseFree,
    };
    widget.saveFilter(selectedFilter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your title'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-Free',
                    'Only include gluten-free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                    _toggleFilter();
                  });
                }),
                _buildSwitchListTile(
                    'lactose-Free',
                    'Only include lactose-free meals',
                    _lcatoseFree, (newValue) {
                  setState(() {
                    _lcatoseFree = newValue;
                    _toggleFilter();
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include Vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                    _toggleFilter();
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include Vegan meals', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                    _toggleFilter();
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
