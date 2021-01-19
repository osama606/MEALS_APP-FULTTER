import 'package:flutter/material.dart';
import 'package:meel_app/dummy_data.dart';
import 'package:meel_app/models/mael.dart';
import 'package:meel_app/screens/filters_screen.dart';
import 'package:meel_app/screens/meal_detail_screen.dart';
import 'package:meel_app/screens/tabs_screen.dart';
import 'screens/cagegory_mael_screen.dart';
import 'screens/categoriesScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'giunten': false,
    'lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };
  List<Meal> _avaliableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMela = [];

  void _setFilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;
      _avaliableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['giunten'] && !meal.isGlutenFree == false) {
          return false;
        }
        ;
        if (_filters['lactose'] && !meal.isLactoseFree == false) {
          return false;
        }
        ;
        if (_filters['Vegan'] && !meal.isVegan == false) {
          return false;
        }
        ;
        if (_filters['Vegetarian'] && !meal.isVegetarian == false) {
          return false;
        }
        ;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMela.indexWhere((meal) => meal.id == mealId);
    if(existingIndex>=0){
      setState(() {
        _favoriteMela.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMela.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorites(String id){
    return _favoriteMela.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mael_App',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.white,
          //   .fromRGBO(200, 200, 200, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'))),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(_favoriteMela),
        CategoryMaelScreen.routeName: (context) =>
            CategoryMaelScreen(_avaliableMeal),
        MealDetailScreen.routName: (context) => MealDetailScreen(_isMealFavorites,_toggleFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
