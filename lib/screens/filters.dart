import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactosFree = false;
  bool _vegan = false;
  bool _vegeterian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactosFree = widget.currentFilters['lactos']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegeterian = widget.currentFilters['vegeterian']!;
    super.initState();
  }

  Widget buildSwitchListTile(
      bool value, String title, String desc, Function(bool) updateVal) {
    return SwitchListTile(
      value: value,
      onChanged: updateVal,
      title: Text(title),
      subtitle: Text(desc),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'lactos': _lactosFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meals selection',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'RobotoCondensed'),
            ),
          ),
          buildSwitchListTile(
              _glutenFree, 'Gluten Free', 'Include meals with no Gluten',
              (val) {
            setState(() {
              _glutenFree = val;
            });
          }),
          buildSwitchListTile(
              _lactosFree, 'Lactos Free', 'Include meals with no Lactos',
              (val) {
            setState(() {
              _lactosFree = val;
            });
          }),
          buildSwitchListTile(_vegan, 'Vegan', 'Include Vegan meals', (val) {
            setState(() {
              _vegan = val;
            });
          }),
          buildSwitchListTile(
              _vegeterian, 'Vegeterian', 'Include Vegeterian meals', (val) {
            setState(() {
              _vegeterian = val;
            });
          })
        ],
      )),
      drawer: MainDrawer(),
    );
  }
}
