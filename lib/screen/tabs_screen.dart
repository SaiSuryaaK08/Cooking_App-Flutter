import 'package:eat_app/screen/categories_screen.dart';
import 'package:eat_app/screen/favourites.dart';
import 'package:eat_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../modal/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String,dynamic>> _pages=[];
  int _selectedPageIndex=0;
  @override
  void initState() {
    _pages=[
      {
        'page':CategoriesScreen(),
        'title':'Categories' ,
      },
      {'page':FavouriteScreen(widget.favouriteMeals),
        'title':'Favourites',
      },
    ];
    // TODO: implement initState
    super.initState();
  }
  void _selectPage(int index){
    setState(() {

      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedPageIndex]['title']),
          ),
         drawer: MainDrawer(),
         body: _pages[_selectedPageIndex]['page'] ,
         bottomNavigationBar: BottomNavigationBar(
           onTap: _selectPage,
           backgroundColor: Theme.of(context).primaryColor,
           unselectedItemColor: Colors.white,
           selectedItemColor: Theme.of(context).primaryColor,
           currentIndex: _selectedPageIndex,
           // type: BottomNavigationBarType.shifting,
           items: [
             BottomNavigationBarItem(
               backgroundColor: Theme.of(context).primaryColor,
                 icon: Icon(Icons.category),
                 label: 'Categories',
             ),
             BottomNavigationBarItem(
               backgroundColor: Theme.of(context).primaryColor,
               icon: Icon(Icons.star),
               label: 'Favourites',
             ),
           ],
         ),

    );
  }
}
