import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview_test/model/food_item.dart';

class FoodRepository {
  Future<List<FoodItem>> fetchFoodItems() async {
    final response = await http
        .get(Uri.parse('https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json'));
    final List<FoodItem> foodList = <FoodItem>[];

    if (response.statusCode == 200) {
      jsonDecode(response.body).forEach((final dynamic item) {
        final FoodItem foodItem =
            FoodItem.fromJson(item as Map<String, dynamic>);
        foodList.add(foodItem);
      });
      return foodList;
    } else {
      throw Exception('Failed to load food item');
    }
  }
}
