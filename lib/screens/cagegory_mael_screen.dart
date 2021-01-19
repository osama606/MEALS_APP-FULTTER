import 'package:flutter/material.dart';
import 'package:meel_app/models/mael.dart';
import 'package:meel_app/wedgets/meal_item.dart';
import '../dummy_data.dart';
import '';

class CategoryMaelScreen extends StatefulWidget {
  static const routeName = 'category_maels';
  final  List<Meal> _avaliableMeal;

  CategoryMaelScreen( this._avaliableMeal) ;

  @override
  _CategoryMaelScreenState createState() => _CategoryMaelScreenState();
}

class _CategoryMaelScreenState extends State<CategoryMaelScreen> {
  String categorytitle;
  List<Meal> displayMeal;

  @override
  void didChangeDependencies() {
    final routeArg =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categorytitle = routeArg['title'];
    displayMeal = widget._avaliableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeal.removeWhere((meal) =>  meal.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeal[index].id,
            imageUrl: displayMeal[index].imageUrl,
            title: displayMeal[index].title,
            affordability: displayMeal[index].affordability,
            complexity: displayMeal[index].complexity,
            duration: displayMeal[index].duration,
          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
