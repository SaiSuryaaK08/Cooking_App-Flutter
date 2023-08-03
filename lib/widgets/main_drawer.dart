import 'package:eat_app/screen/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Container(
            height: 120,
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'Filter',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            onTap: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),

        ],
      ),
    );
  }
}
