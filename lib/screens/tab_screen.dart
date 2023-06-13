// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meal_app/widgets/main_drawer.dart';

import '../modules/meals.dart';
import 'category_screen.dart';
import 'favourits_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favMeals;
  TabsScreen(
    this.favMeals,
  );

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': Menuuu(),
        'title': 'Categories',
      },
      {'page': MyFavorites(widget.favMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  int selectedPageIndex = 0;

  void selectPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_pages[selectedPageIndex]['title']}'),
      ),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: selectedPageIndex,
          onTap: selectPage,
          items: [
            BottomNavigationBarItem(
              label: 'Categories',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.favorite),
            )
          ]),
      drawer: MainDrawer(),
    );
  }
}
