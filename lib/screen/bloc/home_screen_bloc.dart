import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:interview_test/model/food_item.dart';
import 'package:interview_test/repository/food_repository.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  FoodRepository foodRepository = FoodRepository();

  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<LoadFoodDataEvent>(_onLoadFoodDataEvent);
  }

  Future<FutureOr<void>> _onLoadFoodDataEvent(
      LoadFoodDataEvent event, Emitter<HomeScreenState> emit) async {
    try {
      emit(HomeScreenLoadingState());
      List<FoodItem> foodItemList = await foodRepository.fetchFoodItems();
      emit(HomeScreenGetDataSuccessfullyState(foodItemList));
    } on Exception catch (e) {
      emit(HomeScreenGetDataFailedState());
    }
  }
}
