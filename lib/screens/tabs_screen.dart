import 'package:flutter/material.dart';
import 'package:mail_app/models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/favorite_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(),
        'title': 'Favorite',
      },
    ];
    super.initState();
  }

  int _selectedIndexPage = 0;

  void selectPage(int value) {
    setState(() {
      _selectedIndexPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedIndexPage]['title'])),
      body: _pages[_selectedIndexPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndexPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
