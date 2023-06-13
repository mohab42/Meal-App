import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CatItems extends StatelessWidget {
  CatItems(this.id, this.title, this.color);

  final String id;
  final String title;
  final Color color;

  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.catMealsroute,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => selectScreen(context),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
              gradient: LinearGradient(
                colors: [Colors.amber, Colors.limeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
        ),
      ),
    );
  }
}
