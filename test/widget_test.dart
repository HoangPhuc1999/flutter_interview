// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interview_test/custom_widgets/custom_container.dart';

import 'package:interview_test/main.dart';
import 'package:interview_test/model/food_item.dart';

void main() {
  testWidgets('CustomContainer displays food item information', (WidgetTester tester) async {
    // Build a FoodItem model
    final foodItem = FoodItem(
      calories: '516 kcal',
      carbos: '47 g',
      description: '...',
      difficulty: 0,
      fats: '8 g',
      headline: '...',
      id: '533143aaff604d567f8b4571',
      image: 'https://...',
      name: 'Crispy Fish Goujons',
      proteins: '43 g',
      thumb: 'https://...',
      time: 'PT35M',
    );

    // Build the CustomContainer widget
    await tester.pumpWidget(
      MaterialApp(
        home: CustomContainer(
          foodItem: foodItem,
        ),
      ),
    );

    // Verify that the correct information is displayed
    expect(find.text(foodItem.name), findsOneWidget);
    expect(find.text('Calories: ' + foodItem.calories), findsOneWidget);
    expect(find.text('Fats: ' + foodItem.fats), findsOneWidget);
    expect(find.text('Protein: ' + foodItem.proteins), findsOneWidget);
  });
}
