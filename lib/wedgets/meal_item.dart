import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meel_app/screens/meal_detail_screen.dart';
import '../models/mael.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });
  String get complexitext{
    switch(complexity){
      case Complexity.Simple: return "Simple";break;
      case Complexity.Hard: return "Hard";break;
      case Complexity.Challenging: return "Challenging";break;
      default: return 'UnKonwn'; break;
    }
  }
  String get affordabilitytext{
    switch(affordability){
      case Affordability.Affordable: return "Affordable";break;
      case Affordability.Luxurious: return "Luxurious";break;
      case Affordability.Pricey: return "Pricey";break;
      default: return 'UnKonwn'; break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routName,
    arguments: id,
    ).then((result){
      //if(result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 240,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  // right: 10,
                  left: 10,
                  child: Container(
                    width: 180,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 8,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 8,
                      ),
                      Text("$complexitext"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 8,
                      ),
                      Text("$affordabilitytext"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
