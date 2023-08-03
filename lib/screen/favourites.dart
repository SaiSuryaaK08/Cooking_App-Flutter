import 'package:flutter/material.dart';
import '../modal/meal.dart';
import 'package:eat_app/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(
        child: Text('No favourites'),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            ImageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,

          );
        },
        itemCount: favouriteMeals.length,
      );
    }

  }
}
