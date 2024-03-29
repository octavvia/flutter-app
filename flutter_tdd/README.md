documentation this project: 

## 1. add pub lib : 
```
  cupertino_icons: ^1.0.6
  dartz: ^0.10.1
  equatable: ^2.0.5
  flutter_bloc: ^8.1.5
  get_it: ^7.6.7
  http: ^1.2.0
  rxdart: ^0.27.7

```

and pub lib for test
```
  flutter_lints: ^3.0.1
  bloc_test: ^9.1.7
  build_runner: ^2.4.8
  mockito: ^5.4.4
  mocktail: ^1.0.3
```

## 2. Step By Step
- create project structure

domain layer is independent layer

- open web openweather for add url and api key
- constant file : save apiKey in constant file
- [domain/entities] entities.dart -> independent
- [domain/repositories] weather_repository.dart -> ini akan di implementasikan di data layer
    note: pada bagian ini akan error di failur maka diperlukan handle error 
- [constant/error] failure.dart  -> berisi macam2 error yang kemungkinan terjadi dengan blue print failure contohnya 
```
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}
```

- [domain/usecase] get_current_weather.dart -> bersifat future

*** test ***
- delete widget_test.dart on [test/widget_test.dart]
- create layer [data, domain, presentation]
- create file get_current_weather_test.dart on [test/domain/usecase] -> writing test code
- create [test/helper/test_helper.dart]
- generate mock test 
``` 
flutter pub run build_runner build
```
- run test (expetation result : ✓ should get current weather detail from the repository)


*** data ***
- create folder in [lib/data]: data_sources, models, and repositories.


*** test/model ***
- create model folder and weather_model_test.dart then code
- create model in lib folder too

*** data source ***
- create remote_data_source_test.dart in [test/data/data_source]
- create remote_data_source.dart in [lib/data]

- create exception for error [lib/core/error]
- create json reader in helper test [test/helper]

*** repositories ***
- create weather_repository_impl_test.dart [test/data/repositories]
- create weather_repository_impl.dart [lib/data/repositories]


*** presentation ***
- create presentation layer for test -> weather_bloc_test.dart [test/presentation/bloc]
- create bloc in lib [lib/presentation/bloc]
    - weater_state.dart
    - weather_event.dart
    - weather_bloc.dart


*** pages lib ***
- create weather_page.dart [lib/presentation/pages]

*** injection container ***
- create injection_container.dart [lib/injection_container.dart]

*** fixing main.dart ***
- fixing main.dart using bloc state management

*** page test ***
- create page test

screenshoot: 


| ScreenShoot 1 | ScreenShoot 2 | ScreenShoot 3 | ScreenShoot 4 |
|---|---|---|---|
| ![Simulator Screenshot - iPhone 15 Pro Max - 2024-03-29 at 20 37 14](https://github.com/octavvia/flutter-app/assets/86775678/4e09fe01-70dd-46ef-a9ef-94c69e336c44) | ![Simulator Screenshot - iPhone 15 Pro Max - 2024-03-29 at 20 37 29](https://github.com/octavvia/flutter-app/assets/86775678/ad0fb421-280e-49cb-8ef6-660d7b21d026) | ![Simulator Screenshot - iPhone 15 Pro Max - 2024-03-29 at 20 38 10](https://github.com/octavvia/flutter-app/assets/86775678/ceb1f648-b7fd-4a1f-adc8-83b0909e2d07) | <img width="1440" alt="Screenshot 2024-03-29 at 8 39 12 PM" src="https://github.com/octavvia/flutter-app/assets/86775678/1b0b8d9b-b34f-4816-aaad-bc49eb6f46a8"> |









