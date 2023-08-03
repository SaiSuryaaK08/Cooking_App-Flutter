import 'package:eat_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../modal/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal>availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  String categoryTitle='';
  List<Meal>displayedMeals=[];
  var _loadedInitdata=false;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if(!_loadedInitdata){
      final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>; //Adding ! after context disables null safety
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'] as String;

      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitdata=true;
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              ImageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,

          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
