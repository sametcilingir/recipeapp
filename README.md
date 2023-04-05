# Recipe App - README

## Table of Contents
- [About](#about)
- [Features](#features)
- [Demo](#demo)
- [Layered Architecture](#layered-architecture)
- [Run Locally](#run-locally)
- [Libraries](#libraries)

## About
This is a Flutter mobile app that allows users to search for and save their favorite recipes. The app uses the Edamam Recipe Search API to search for recipes and retrieve recipe details. Users can search for recipes based on ingredients or recipe names and view the recipe details, including the name, ingredients, and instructions. They can save recipes to their favorites list and remove them from the list.

The app uses state management with MobX, navigation with go_router, and a local database with Hive. It also uses Dio for network requests.

## Features
- Search for recipes based on ingredients or recipe names
- View recipe details, including the name, ingredients, and instructions
- Save recipes to favorites list
- Remove recipes from favorites list
- Filter search results by dietary requirements such as vegan, gluten-free, etc.
- Implement a "random recipe" feature that allows users to find a random recipe.
- Implement a recipe-sharing feature that allows users to share a recipe with their friends via email or social media.
- The app supports both light and dark themes based on the phone's settings.

## Demo and Screenshots
[![Demo Video](https://img.youtube.com/vi/PkdCSASwyQQ/0.jpg)](https://youtube.com/shorts/PkdCSASwyQQ)
<p float="left" align="middle">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.08.18.png">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.08.24.png">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.08.30.png">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.08.40.png">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.08.43.png">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.08.50.png">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.09.00.png">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.09.16.png">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.09.23.png">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.09.26.png">
<img align="center" width="250" height="530" src="screenshots/Simulator Screenshot - iPhone 14 Pro Max - 2023-04-05 at 18.09.31.png">
</p>

# Layered Architecture

The layered architecture is a software design pattern that involves organizing the components of an application into layers. Each layer has a specific responsibility and interacts with the other layers to perform its tasks. The purpose of this design pattern is to separate the different concerns of an application into distinct layers, making the code more modular and maintainable.

In this document, we will describe how the layered architecture can be applied in a Flutter project. The layered architecture is a common design pattern that involves organizing the components of an application into layers. It can help to make the code more modular and maintainable by separating the different concerns of the application into distinct layers.

**Layers**

The layered architecture typically consists of four layers: the application layer, the data layer, the domain layer, and the presentation layer.

**Application Layer**

The application layer is the entry point for the application, and is responsible for initializing the basic components and setting up the necessary infrastructure. It may contain classes for constants, enums, and handlers that are used throughout the application.

**Data Layer**

The data layer is responsible for retrieving and organizing data from both local and remote sources. It may contain classes for models and services that represent the data and perform related tasks.

**Domain Layer**

The domain layer is where the different components of the domain are combined and organized. It may contain classes for entities, exceptions, and repositories that are used to manage and manipulate the data in the application.

**Presentation Layer**

The presentation layer is responsible for rendering the user interface and displaying the data to the user. It may contain classes for features, models, views, and view models that are used to build the user interface and manage the data displayed on the screen.

| Layer | Description | Interactions with other layers |
| --- | --- | --- |
| Application | Initializes the basic components and sets up the necessary infrastructure for the application. | Initializes components in other layers |
| Data | Retrieves and organizes data from local and remote sources. | Provides data to domain layer |
| Domain | Combines and organizes the different components of the domain, and manages and manipulates the data. | Calls methods on data layer to retrieve data |
| Presentation | Renders the user interface and displays the data to the user. | Requests data from data layer and displays it to the user |

In this table, the "Interactions with other layers" column describes how each layer interacts with the other layers in the architecture. For example, the application layer may initialize the components in the data, domain, and presentation layers, while the data layer provides data to the domain layer. The presentation layer may request data from the data layer and display it to the user.

lib

├── application

│   ├── constant

│   └── handler

├── data

│   ├── model

│   └── service

├── domain

│   ├── entity

│   ├── exception

│   └── repository

└── presentation

├── feature

│   ├── model

│   ├── view

│   └── view_model

└── main.dart

In this folder structure, the application, data, domain, and presentation directories represent the four layers of the architecture. Each of these directories contains subdirectories for the different classes that belong to that layer, such as constant, enum, and handler for the application layer, or model, view, and view_model for the presentation layer. The main.dart file in the presentation layer contains the entry point for the Flutter application.

The organization of the classes in this folder structure follows the principles of the layered architecture, with each layer having a specific responsibility and interacting with the other layers in a well-defined way. This can help to make the code more modular and maintainable.


## Run Locally

Clone the project

```bash
  git clone https://github.com/sametcilingir/recipeapp
```

Go to the project directory

```bash
  cd recipeapp
```

Create a .env file in the assets folder and write your api keys form the Edamam Recipe Search API(https://developer.edamam.com/edamam-docs-recipe-api)

```dart
  EDAMAM_APP_ID=[your app id]
  EDAMAM_RECIPT_APP_KEY=[your app key]
```

Install dependencies

```bash
  flutter pub get
```

Watch build_runner 
```bash
  dart pub global activate flutter_scripts
  flutter_scripts run 
  <Enter>
```


Run app

```bash
  flutter run
```


## Libraries
- State Managment
    - [MobX](https://pub.dev/packages/mobx)
    - [Flutter MobX](https://pub.dev/packages/flutter_mobx)
    - [MobX Codegen](https://pub.dev/packages/mobx_codegen)
    - [Build Runner](https://pub.dev/packages/build_runner)

- Dependency Injection
    - [Get It](https://pub.dev/packages/get_it)
    - [Injectable](https://pub.dev/packages/injectable)
    - [Injectable Generator](https://pub.dev/packages/injectable_generator)

- Navigation
    - [Go Router](https://pub.dev/packages/go_router)


- Local Database
    - [Hive](https://pub.dev/packages/hive)
    - [Hive Flutter](https://pub.dev/packages/hive_flutter)
    - [Hive Generator](https://pub.dev/packages/hive_generator)
    - [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage)

- Network
    - [Dio](https://pub.dev/packages/dio)
    
- Dynamic Theme
    - [Flex Color Scheme](https://pub.dev/packages/flex_color_scheme)
    - [Google Fonts](https://pub.dev/packages/google_fonts)

- JSON Parse
    - [Json Serializable](https://pub.dev/packages/json_serializable)
    - [Json Annotation](https://pub.dev/packages/json_annotation)

- Equatable Converter
    - [Freezed](https://pub.dev/packages/freezed)
    - [Freezed Annotation](https://pub.dev/packages/freezed_annotation)

- Error Handling
    - [Either Dart](https://pub.dev/packages/either_dart)

- ViewState Loading
    - [Flutter Easy Loading](https://pub.dev/packages/flutter_easyloading)

- Hide Keys
    - [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv)

- Lints
    - [Flutter Lints](https://pub.dev/packages/flutter_lints)

- Refresh Indicator
    - [Pull To Refresh](https://pub.dev/packages/pull_to_refresh)

- Shimmer Effect
    - [Shimmer](https://pub.dev/packages/shimmer)

- Share Data
    - [Share](https://pub.dev/packages/share_plus)

- Widget Extensions
    - [Slidable](https://pub.dev/packages/slidable)
    - [Group Button](https://pub.dev/packages/group_button)


## IDE Version
- Flutter version 3.7.9 on channel stable (from git)
- Upstream repository https://github.com/flutter/flutter.git
- Framework revision 62bd79521d (6 days ago), 2023-03-30 10:59:36 -0700
- Engine revision ec975089ac
- Dart version 2.19.6
- DevTools version 2.20.1

## License

App is distributed under the terms of the MIT License. See the
[license](LICENSE.md) for more information.