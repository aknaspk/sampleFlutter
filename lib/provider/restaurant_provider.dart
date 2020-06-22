import 'package:flutter/foundation.dart';
import '../services/restaurant_service.dart';
import '../models/restaurant_model.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantModel _restaurant;
  RestaurantService _restaurantService = RestaurantService();
  final String _apiUrl = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
  int totalCount = 0;
  RestaurantProvider() {
    init();
  }

  init() async {
    _restaurant = await _restaurantService.getRestaurant(apiUrl: _apiUrl);
    notifyListeners();
  }

  // getters
  RestaurantModel get restaurants => _restaurant;

  //
  void addDish({@required int tableIndex, @required int dishIndex}) {
    _restaurant.tables[tableIndex].dishes[dishIndex].count++;
    totalCount++;
    notifyListeners();
  }

  void removeDish({@required int tableIndex, @required int dishIndex}) {
    _restaurant.tables[tableIndex].dishes[dishIndex].count--;
    totalCount--;
    notifyListeners();
  }
}
