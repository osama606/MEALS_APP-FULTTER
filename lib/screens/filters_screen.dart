import 'package:flutter/material.dart';
import '../wedgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function savefilters;
  final Map<String,bool> currentFiltres;

  FiltersScreen(this.currentFiltres, this.savefilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState(){
     _isGlutenFree = widget.currentFiltres['giunten'];
     _isLactoseFree = widget.currentFiltres['lactose'];
     _isVegan = widget.currentFiltres['Vegan'];
     _isVegetarian = widget.currentFiltres['Vegetarian'];
    super.initState();
  }

  Widget BulidListtile(String title, String description, bool currentValue,
      Function updeadValue) {
  return  SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updeadValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("filters"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed:(){
                final Map<String,bool> selectedFiltres= {
                  'giunten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'Vegan': _isVegan,
                  'Vegetarian': _isVegetarian,
                };
                widget.savefilters(selectedFiltres);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                BulidListtile("Gluten-free", "Only include giunten-free meals",
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                SizedBox(
                  height: 20,
                ),
                BulidListtile("Lactose-free", "Only include lactose-free meals",
                    _isLactoseFree, (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                BulidListtile("Vegetarian", "Only include Vegetarian meals",
                    _isVegetarian, (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                BulidListtile("Vegan", "Only include Vegan meals",
                    _isVegan, (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    }),


              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
