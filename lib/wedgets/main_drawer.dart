import 'package:flutter/material.dart';
import 'package:meel_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget BuildListtile(String title,IconData icon , Function tapHandler){
    return  ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.teal,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.teal
        ),
      ),
      onTap: tapHandler,
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
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            alignment: Alignment.centerLeft,
            color: Colors.teal,
          ),
          SizedBox(
            height: 20,
          ),
          BuildListtile("Meal",Icons.restaurant ,(){Navigator.of(context).pushReplacementNamed('/');}),
          BuildListtile("Filters", Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);})
        ],
      ),
    );
  }
}
