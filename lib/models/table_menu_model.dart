import './dish_model.dart';

class TableMenuModel {
  List<DishModel> dishes;
  final String category, id;
  final String image;

  TableMenuModel.fromJson(Map<String, dynamic> table)
      : id = table["menu_category_id"],
        category = table["menu_category"],
        image = table["menu_category_image"][0],
        dishes = new List<DishModel>.from((table["category_dishes"]).map((i) {
          return DishModel.fromJson(i);
        }));
}
