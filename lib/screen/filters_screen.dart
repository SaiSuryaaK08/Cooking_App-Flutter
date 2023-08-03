import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName='/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lactoseFree=false;

  @override
  void initState() {
    _glutenFree=widget.currentFilters['gluten']!;
    _lactoseFree=widget.currentFilters['lactose']!;
    _vegetarian=widget.currentFilters['vegetarian']!;
    _vegan=widget.currentFilters['vegan']!;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: (){
                final selectedFilters={
                'gluten':_glutenFree,
                'lactose':_lactoseFree,
                'vegan':_vegan,
                'vegetarian':_vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save),)
        ],
      ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust Meal Selection',style: Theme.of(context).textTheme.headline1,),
            ),
            Expanded(
                child: ListView(
                  children: [
                    SwitchListTile(
                        title: Text('Gluten Free'),
                        value: _glutenFree,
                        subtitle: Text('Add only gluten free meals'),
                        onChanged: (newValue){
                          setState(() {
                            _glutenFree =newValue;
                          });
                        },
                    ),
                    SwitchListTile(
                      title: Text('Vegetarian'),
                      value: _vegetarian,
                      subtitle: Text('Add only  vegetarian meals'),
                      onChanged: (newValue){
                        setState(() {
                          _vegetarian =newValue;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Vegan Free'),
                      value: _vegan,
                      subtitle: Text('Add only vegan meals'),
                      onChanged: (newValue){
                        setState(() {
                          _vegan =newValue;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Lactose Free'),
                      value: _lactoseFree,
                      subtitle: Text('Add onlylactose free meals'),
                      onChanged: (newValue){
                        setState(() {
                          _lactoseFree =newValue;
                        });
                      },
                    ),
                  ],
                ),
            ),
          ],
        ),
    );
  }
}
