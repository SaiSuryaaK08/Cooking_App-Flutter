import '../screen/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem(this.title,this.color,this.id);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {'id': id, 'title': title,
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(// kinda like navigating button with ripple effect
      onTap:()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
          child: Text(title,style: Theme.of(context).textTheme.headline1,
        ),
        decoration:BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.7),
                  color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            ),
         borderRadius: BorderRadius.circular(15),
        )
      ),
    );
  }
}
