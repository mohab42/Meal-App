import 'package:flutter/material.dart';
import '../widgets/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = 'meal_details';
  final Function toggleFavs;
  final Function isFav;

  MealDetails(this.toggleFavs, this.isFav);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildText(context, "Ingredients"),
            buildContainer(Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectedMeal.ingredients[i]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            )),
            buildText(context, 'Steps'),
            buildContainer(
              Container(
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemBuilder: (ctx, i) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${i + 1}'),
                          ),
                          title: Text(selectedMeal.steps[i]),
                        ),
                        Divider(
                          color: Colors.grey,
                        )
                      ],
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavs(mealId),
        child: Icon(isFav(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}

Container buildContainer(Widget child) {
  return Container(
    width: 300,
    height: 150,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    child: child,
  );
}

Container buildText(BuildContext context, String text) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    child: Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    ),
  );
}
