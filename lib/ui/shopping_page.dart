import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/restaurant_provider.dart';
import './widgets/AppLoading.dart';
import '../models/restaurant_model.dart';
import './widgets/CustomTabView.dart';
import './widgets/DishLists.dart';
import './widgets/CartIcon.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RestaurantProvider(),
        child: Consumer<RestaurantProvider>(
          builder: (context, restaurantProvider, child) {
            if (restaurantProvider.restaurants == null) {
              return AppLoading();
            } else {
              RestaurantModel restaurant = restaurantProvider.restaurants;
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  title: Text(
                    restaurant.branchName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  ),
                  backgroundColor: Colors.white,
                  actions: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "My Orders",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        CartIcon()
                      ],
                    )
                  ],
                ),
                body: CustomTabView(
                  initPosition: 0,
                  itemCount: restaurant.tables.length,
                  tabBuilder: (context, index) =>
                      Tab(text: restaurant.tables[index].category),
                  pageBuilder: (context, index) => DishLists(
                    tableIndex: index,
                  ),
                ),
              );
            }
          },
        ));
  }
}
