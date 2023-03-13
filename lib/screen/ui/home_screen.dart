import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_test/custom_widgets/custom_container.dart';
import 'package:interview_test/model/food_item.dart';
import 'package:interview_test/screen/bloc/home_screen_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeScreenBloc homeScreenBloc = HomeScreenBloc();

  @override
  void initState() {
    /// Triggered the event load food data
    homeScreenBloc.add(LoadFoodDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      /// Handling state of the application with bloc
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        bloc: homeScreenBloc,
        builder: (context, state) {
          if (state is HomeScreenLoadingState) {
            return loadingWidget(context);
          } else if (state is HomeScreenGetDataFailedState) {
            return failedWidget(context);
          } else if (state is HomeScreenGetDataSuccessfullyState) {
            return buildListOfFood(context, state.foodItems);
          }
          return Container();
        },
      ),
    );
  }

  /// Populate the item with list view
  Widget buildListOfFood(BuildContext context, List<FoodItem> foodItems) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: foodItems.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 5,
          color: Colors.grey,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return CustomContainer(
          foodItem: foodItems[index],
        );
      },
    );
  }

  /// Loading Widget when call api, display this widget
  Widget loadingWidget(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ),
    );
  }

  /// Widget for when api calls fail
  Widget failedWidget(BuildContext context) {
    return const Center(
      child: Text('Something went wrong'),
    );
  }
}
