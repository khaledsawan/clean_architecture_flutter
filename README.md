# Clean Architecture Flutter Project

![Project Folder Structure](https://raw.githubusercontent.com/khaledsawan/clean_architecture_flutter/main/architecture-proposal.png)

## Project Overview

This Flutter project follows the Clean Architecture pattern, which promotes separation of concerns and maintainability. The project is structured into several layers:

- **Presentation Layer**: Contains widgets, pages, and presentation logic (Bloc). Handles the user interface and user interactions.

- **Domain Layer**: Contains use cases and domain entities and abstract Repository.

- **Data Layer**: Manages data sources, repositories, and data models. Responsible for data retrieval and storage. Divided into `repositories`, `model`, `local_data_sources`, and `remote_data_sources`.

## Key Features

## Login Feature

Our application includes a robust login system. Here are the key aspects of this feature:

- **Input Validation**: We ensure that user inputs, such as email and password, are validated to maintain data integrity.

- **Authentication**: Upon entering valid credentials, users are authenticated and granted access to their accounts.

## Signup Feature

Creating an account is straightforward with our signup feature. Key elements include:

- **Input Validation**: Similar to the login feature, we validate user inputs to ensure data accuracy with Image file validation.

- **Create Accout**: Upon entering valid credentials, users are valid to create accout.

## Folder Structure

- **lib/features/Feature/**
  - **presentation/**: Contains widgets and presentation logic.
  - **domain/**: Contains use cases and domain entities.
  - **data/**
    - **repositories/**: Implements data repositories.
    - **model/**: Defines data models.
    - **local_data_sources/**: Manages local data sources.
    - **remote_data_sources/**: Handles remote data sources.

## Packages

- **flutter**: The Flutter SDK.
- **cupertino_icons**: Provides the Cupertino icons used in the project.
- **shared_preferences**: A plugin for accessing and storing key-value pairs on the device.
- **get_it**: A service locator for dependency injection.
- **dartz**: A functional programming package that provides common algebraic data types and functions.
- **flutter_bloc**: A state management library based on the BLoC (Business Logic Component) pattern.
- **equatable**: A utility package for comparing objects for equality.
- **dio**: A powerful HTTP client for making API requests.
- **formz**: A package for handling form validation and state management.
- **go_router**: A declarative router for Flutter applications.
- **mime**: A package for working with MIME types.
- **file_picker**: A plugin for picking files from the device.
- **mocktail**: A mocking library for Dart and Flutter tests.
- **internet_connection_checker**: A package for checking internet connectivity.

In addition to the dependencies, there are also some dev dependencies used for testing and code generation:

- **flutter_test**: The Flutter test framework.
- **mockito**: A mocking library for Dart and Flutter tests.
- **build_runner**: A tool for generating code during the build process.
- **bloc_test**: A testing utility for testing BLoCs.
- **network_image_mock**: A package for mocking network images during tests.
