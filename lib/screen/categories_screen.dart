import 'package:eat_app/widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((catdata)=>CategoryItem(
              catdata.title,
              catdata.color,
              catdata.id,
             )
          ).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3/2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
          ),

    );
  }
}
