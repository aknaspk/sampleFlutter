import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/restaurant_model.dart';

class RestaurantService {
  Future getRestaurant({String apiUrl}) async {
    try {
      var res = await http
          .get(Uri.encodeFull(apiUrl), headers: {"Accept": "application/json"});
      if (res.statusCode != 200) {
        print(res.statusCode);
      } else {
        return RestaurantModel.fromJson((json.decode(res.body)[0]));
      }
    } catch (e) {
      // now printing
      print(e);
    }
  }
}
