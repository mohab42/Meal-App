import 'package:flutter/material.dart';

import '../screens/filters.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 100,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }

  Widget buildListTile(
    String title,
    IconData icon,
    Function() tapHandler,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: tapHandler,
    );
  }
}
