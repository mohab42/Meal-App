import 'package:flutter/material.dart';
import '../modules/meals.dart';
import '../widgets/meals_pics.dart';

class MyFavorites extends StatelessWidget {
  List<Meal> favMeals;
  MyFavorites(this.favMeals);
  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
          child: Text('You have no favorites yet - start adding some!'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          return MealsPics(
            id: favMeals[i].id,
            imageUrl: favMeals[i].imageUrl,
            title: favMeals[i].title,
            duration: favMeals[i].duration,
            complexity: favMeals[i].complexity,
            affordability: favMeals[i].affordability,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}
