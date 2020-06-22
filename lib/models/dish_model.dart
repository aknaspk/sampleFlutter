class DishModel {
  // now addonCat is bool
  final double price, calories;
  final String image, currency, description, id, name;
  final bool availability, addonCat;
  int count = 0;

  DishModel(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.description,
      this.currency,
      this.calories,
      this.availability,
      this.addonCat});

  DishModel.fromJson(Map<String, dynamic> dish)
      : id = dish["dish_id"],
        name = dish["dish_name"],
        price = double.parse(dish["dish_price"].toString()),
        image = dish["dish_image"],
        currency = dish["dish_currency"],
        description = dish["dish_description"],
        calories = double.parse(dish["dish_calories"].toString()),
        availability = dish["dish_Availability"],
        addonCat = (dish["addonCat"].length == 0 ? false : true);
}
