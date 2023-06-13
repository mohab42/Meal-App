import 'package:flutter/material.dart';
import 'package:meal_app/widgets/dummy_data.dart';
import '../modules/meals.dart';
import '../widgets/meals_pics.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen(this.availableMeals, {super.key});
  static const String catMealsroute = 'category_meals';
  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routArgs['id'];
    final catTitle = routArgs['title'];
    final displayedMeals = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('${catTitle}'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealsPics(
            id: displayedMeals[i].id,
            imageUrl: displayedMeals[i].imageUrl,
            title: displayedMeals[i].title,
            duration: displayedMeals[i].duration,
            complexity: displayedMeals[i].complexity,
            affordability: displayedMeals[i].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
