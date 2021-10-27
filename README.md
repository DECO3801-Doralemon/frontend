# Frontend side of Pantry Saver

## Developers

1. Akbar Putra Novial (Front-End)
2. Aljihad Ijlal Nadhif Suyudi (Front-End)
3. Amal Adiguna (Back-End, Team Leader)
4. Figo Muhammad Alfaritzi (Back-End)
5. Muhammad Gibran Raksadino (UI/UX)
6. Muhammad Rizal Alfaridzi (UI/UX, Front-End)

## Install
The front end side uses Flutter, for installing please head to the [official documentation of Flutter](https://flutter.dev/docs/get-started/install)

Make sure you already installed everything to work with Flutter with command:
```bash
flutter doctor -v
```

Install all the package dependencies in `pubspec.yaml`
```bash
flutter pub get
```

## Running the App
Run the app using the development flavor
```bash
flutter run -t lib/main.dart
```
## Building Models with JsonSerializable
Jadi abis get dari API, jsonnya di map ke models biar rapih.
After GET the result from API, you make the models.
1. Write the fields based on the JSON results (Example: models/login.dart)
2. On 'part of {model_name}.g.dart', write it on the model you want to make. It will be red, but just ignore it for now.
3. Afte you write all the fields, run
```bash
flutter pub run build_runner build
```
4. It will build a file called {model_name}.g.dart, it should not red anymore.

## Passing Data with BLoC
Read more on [here](https://itnext.io/flutter-handling-your-network-api-calls-like-a-boss-936eef296547) to understand about BLoC. 

