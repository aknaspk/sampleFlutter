import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './DishCard.dart';
import '../../provider/restaurant_provider.dart';

class DishLists extends StatelessWidget {
  final int tableIndex;
  DishLists(
      {
      @required this.tableIndex});
  @override
  Widget build(BuildContext context) {
    var dishList = Provider.of<RestaurantProvider>(context)
        .restaurants
        .tables[tableIndex]
        .dishes;
    return ListView.builder(
        itemCount: dishList.length,
        itemBuilder: (context, index) {
          return DishCard(
            dishIndex: index,
            tableIndex: tableIndex,
          );
        });
  }
}
