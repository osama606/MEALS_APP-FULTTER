import 'package:flutter/material.dart';
import 'package:meel_app/models/mael.dart';
import '../screens/categoriesScreen.dart';
import '../screens/favorites_screen.dart';
import '../wedgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMela;

  const TabsScreen(this.favoriteMela);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _Pages;

  @override
  initState() {
    _Pages =[
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page':FavoritesScreen(widget.favoriteMela),
        'title':'Your Favorite '
      }
    ];
    super.initState();
  }

  int _selectedPageindex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectedPageindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_Pages[_selectedPageindex]['title']),
      ),
      body: _Pages[_selectedPageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.teal,
          onTap: _selectPage,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedPageindex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Category"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text("Favorites"),
            ),
          ]),
      drawer: MainDrawer(),
    );
  }
}
