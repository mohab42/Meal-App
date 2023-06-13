import 'package:flutter/material.dart';
import '../widgets/menu.dart';
import '../widgets/dummy_data.dart';

class Menuuu extends StatelessWidget {
  const Menuuu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((menuData) {
          return CatItems(menuData.id, menuData.title, menuData.color);
        }).toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
