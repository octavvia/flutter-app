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
: domain layer is independent layer:
- open web openweather for add url and api key
- constant file : save apiKey in constant file
- entities.dart
- [repositories] weather_repository.dart -> ini akan di implementasikan di data layer
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

