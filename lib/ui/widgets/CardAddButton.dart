import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/dish_model.dart';
import '../../provider/restaurant_provider.dart';

class CardAddButton extends StatelessWidget {
  final dishIndex, tableIndex;

  CardAddButton({@required this.tableIndex, @required this.dishIndex});
  @override
  Widget build(BuildContext context) {
    DishModel dish = Provider.of<RestaurantProvider>(context)
        .restaurants
        .tables[tableIndex]
        .dishes[dishIndex];
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.lightGreen,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Material(
              color: Colors.lightGreen,
              child: InkWell(
                splashColor: Colors.grey,
                child: SizedBox(
                    width: 50,
                    height: 35,
                    child: Icon(
                      Icons.remove,
                      size: 30,
                      color: Colors.white,
                    )),
                onTap: () {
                 Provider.of<RestaurantProvider>(context,listen: false).removeDish(tableIndex: tableIndex, dishIndex: dishIndex); 
                },
              ),
            ),
            Text(
              dish.count.toString(),
              style: TextStyle(color: Colors.white),
            ),
            Material(
              color: Colors.lightGreen,
              child: InkWell(
                splashColor: Colors.grey,
                child: SizedBox(
                    width: 50,
                    height: 35,
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    )),
                onTap: () {
                 Provider.of<RestaurantProvider>(context,listen: false).addDish(tableIndex: tableIndex, dishIndex: dishIndex); 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
