# interview_test

For implementing data loading, basic UI, and error handling, I have used Flutter framework along with the BLoC architecture pattern. I have created a separate module for the data layer, which consists of repository, data sources, and models. The UI layer consists of widgets that get their data from the BLoC layer. The BLoC layer handles the business logic and communicates with the data layer and UI layer.

The implementation consists of the following files and folders:

main.dart: This file is the entry point of the application. It sets up the MaterialApp widget and initializes the BLoC provider.

screen/: This folder contains all the UI widgets used in the app. Each widget gets its data from the BLoC layer and displays it.

bloc/: This folder contains the BLoC classes that handle the business logic. It communicates with the data layer and UI layer.

repository/ and model/: This folder contains the repository, data sources, and models used in the app. The repository communicates with the data sources to get data and returns it to the BLoC layer.

The widget tests for the UI layer test the widgets used in the app. They ensure that the widgets display the correct data and handle user interactions correctly.




https://user-images.githubusercontent.com/54959333/224690907-b367b7cf-9cd4-4be7-aa68-68deac2b0634.mov

