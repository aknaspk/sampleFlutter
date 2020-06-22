import './table_menu_model.dart';

class RestaurantModel {
  final String name, image, tableName, branchName, tableId, id;
  List<TableMenuModel> tables;

  RestaurantModel.fromJson(Map<String, dynamic> restaurant)
      : id = restaurant["restaurant_id"],
        tableId = restaurant["table_id"],
        image = restaurant["restaurant_image"][0],
        name = restaurant["restaurant_name"],
        tableName = restaurant["table_name"],
        branchName = restaurant["branch_name"],
        tables = new List<TableMenuModel>.from(
            (restaurant["table_menu_list"] as List)
                .map((i) => TableMenuModel.fromJson(i))
                .toList());
}
