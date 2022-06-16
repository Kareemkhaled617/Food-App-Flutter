import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget listTileBuild(String title, IconData icon,Function tabHandler) {
    return ListTile(
      onTap: tabHandler,
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking UP',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listTileBuild('Meal', Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          listTileBuild('Filter', Icons.settings,(){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);})
        ],
      ),
    );
  }
}
