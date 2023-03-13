part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenGetDataSuccessfullyState extends HomeScreenState {
  HomeScreenGetDataSuccessfullyState(this.foodItems);

  final List<FoodItem> foodItems;
}

class HomeScreenGetDataFailedState extends HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}
