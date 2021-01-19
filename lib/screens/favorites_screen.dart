import 'package:flutter/material.dart';
import 'package:meel_app/models/mael.dart';
import 'package:meel_app/wedgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMela;

  FavoritesScreen( this.favoriteMela);
  @override
  Widget build(BuildContext context) {
    if(favoriteMela.isEmpty){
      return Center(
        child: Text("You have favorites yet - start adding some !"),
      );
    }
    else{
      return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
           // removeItem: _removeMeal,
            id: favoriteMela[index].id,
            imageUrl: favoriteMela[index].imageUrl,
            title: favoriteMela[index].title,
            affordability: favoriteMela[index].affordability,
            complexity: favoriteMela[index].complexity,
            duration: favoriteMela[index].duration,
          );
        },
        itemCount: favoriteMela.length,
      );
    }
  }
}
