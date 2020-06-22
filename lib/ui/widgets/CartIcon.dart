import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/restaurant_provider.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  int totalCount =  Provider.of<RestaurantProvider>(context).totalCount;
     return Badge(
      position: BadgePosition.topRight(top: 0, right: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        totalCount.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart,
      color: Colors.grey.shade700,
      ), onPressed: () {}),
    );
  }
}
