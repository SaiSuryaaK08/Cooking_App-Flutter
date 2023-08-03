import 'package:eat_app/screen/filters_screen.dart';
import 'package:eat_app/screen/meal_detail_screen.dart';
import 'package:eat_app/screen/tabs_screen.dart';

import './screen/category_meals_screen.dart';

import './screen/categories_screen.dart';
import 'package:flutter/material.dart';
import 'dummy_data.dart';
import './modal/meal.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>_filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal>_availableMeals=DUMMY_MEALS;
  List<Meal>_favouriteMeals=[];

  void _setFilters(Map<String,bool>filterData){
    setState(() {
      _filters=filterData;
      _availableMeals=DUMMY_MEALS.where((meal){
        if(_filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree ){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian']! && meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  void _toggleFavourite(String mealId){
    final existingIndex=_favouriteMeals.indexWhere(
            (meal) => meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId)
        );
      });
    }
  }
  bool _isMealFavourite(String id){
    return _favouriteMeals.any((meal) => meal.id==id);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 5),
          ),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 5),
         ),
          headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
          ),
      ),
      ),
      // home:  CategoriesScreen(),
      routes: {
        '/':(ctx)=>TabsScreen(_favouriteMeals),//default route for home page
        CategoryMealsScreen.routeName:(ctx)=> CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(_toggleFavourite,_isMealFavourite),
        FiltersScreen.routeName:(ctx)=>FiltersScreen(_filters,_setFilters),
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (context)=>CategoriesScreen());
      // },this is a default page taken if there are no valid routes in above
         onUnknownRoute:(settings){
        return MaterialPageRoute(builder: (context)=>CategoriesScreen());
         },//incase of error loading routes this will be shown
    );
  }
}

