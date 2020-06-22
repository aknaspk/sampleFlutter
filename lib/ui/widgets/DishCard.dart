import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/dish_model.dart';
import './CardAddButton.dart';
import '../../provider/restaurant_provider.dart';

class DishCard extends StatelessWidget {
//  final DishModel dish;
  final int dishIndex, tableIndex;
  DishCard(
      {
      //  @required this.dish,
      @required this.dishIndex,
      @required this.tableIndex});
  @override
  Widget build(BuildContext context) {
    DishModel dish = Provider.of<RestaurantProvider>(context)
        .restaurants
        .tables[tableIndex]
        .dishes[dishIndex];
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.3,
        color: Colors.grey,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    dish.name,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${dish.currency}  ${dish.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      "${dish.calories.toStringAsFixed(0)} calories",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    dish.description,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardAddButton(
                    dishIndex: dishIndex,
                    tableIndex: tableIndex,
                  ),
                ),
                dish.addonCat
                    ? Text("Customizations available",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12
                    ),
                    )
                    : SizedBox.shrink()
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              dish.image,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
