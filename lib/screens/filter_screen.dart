import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  Function _saveFilter;
  final Map<String, bool> _currentFilter;

  FilterScreen(this._saveFilter, this._currentFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;

  bool lactoseFree = false;

  bool vegan = false;

  bool vegetarian = false;

  @override
  void initState() {
    glutenFree = widget._currentFilter['gluten'];
    lactoseFree = widget._currentFilter['lactose'];
    vegan = widget._currentFilter['vegan'];
    vegetarian = widget._currentFilter['vegetarian'];

    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String supTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(supTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectFilter = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };
              widget._saveFilter(selectFilter);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten-Free', 'Only include Gluten-Free meal ', glutenFree,
                    (newValue) {
                  setState(
                    () {
                      glutenFree = newValue;
                    },
                  );
                }),
                buildSwitchListTile('Lactose-Free',
                    'Only include Lactose-Free meal ', lactoseFree, (newValue) {
                  setState(
                    () {
                      lactoseFree = newValue;
                    },
                  );
                }),
                buildSwitchListTile(
                    'Vegan-Free', 'Only include Vegan-Free meal ', vegan,
                    (newValue) {
                  setState(
                    () {
                      vegan = newValue;
                    },
                  );
                }),
                buildSwitchListTile(
                    'Vegetarian-Free',
                    'Only include Vegetarian-Free meal ',
                    vegetarian, (newValue) {
                  setState(
                    () {
                      vegetarian = newValue;
                    },
                  );
                })
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
