import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = 'Meal_detail';
  final Function toggleFavorite;
  final Function isMealFavorites;

   MealDetailScreen(this.isMealFavorites, this.toggleFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Ingredients",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.teal),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 178,
            width: 400,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) => Card(
                color: Colors.teal,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1
                    ),
                  ),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Steps",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.teal),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 200,
            width: 400,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index+1}"),
                    ),
                    title: Text(selectedMeal.steps[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> toggleFavorite(mealId),
        child: Icon(
          isMealFavorites(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
