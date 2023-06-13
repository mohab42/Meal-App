import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/tab_screen.dart';
import 'package:meal_app/widgets/dummy_data.dart';
import '../modules/meals.dart';
import '../screens/category_meals_screen.dart';
import '../screens/meal_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactos': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  toggleFavs(String mealId) {
    final currentIndex = _favMeals.indexWhere((meal) => meal.id == mealId);

    if (currentIndex >= 0) {
      _favMeals.removeAt(currentIndex);
    } else {
      setState(() {
        _favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactos']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegeterian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  isFavorite(String id) {
    return _favMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromARGB(255, 242, 238, 191),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyMedium: const TextStyle(
                  color: Colors.black,
                ),
                bodySmall: const TextStyle(
                  color: Colors.black,
                ),
                titleMedium: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              )),
      routes: {
        '/': (context) => TabsScreen(_favMeals),
        CategoryMealsScreen.catMealsroute: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetails.routeName: (context) => MealDetails(toggleFavs, isFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
