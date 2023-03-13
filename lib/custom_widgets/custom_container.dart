import 'package:flutter/material.dart';
import 'package:interview_test/model/food_item.dart';

class CustomContainer extends StatelessWidget {
  final FoodItem foodItem;

  const CustomContainer({Key? key, required this.foodItem}) : super(key: key);
  /// This custom widget is to display the information provided in the json file
  /// I only decided to display some basic information hehehe
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(foodItem.thumb, fit: BoxFit.cover),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodItem.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Calories: '+foodItem.calories,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                'Fats: '+foodItem.fats,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                'Protein: '+foodItem.proteins,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
