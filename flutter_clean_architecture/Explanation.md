Documentation:

![Untitled Diagram drawio (1)](https://github.com/octavvia/dummy-ddd-bloc/assets/86775678/3b4d30c3-821d-43f2-b768-ba58b2c1842b)


step : 
buat structure
- constant -> menampung http dll

- data_state.dart

- entities -> response or request 

- article_repository.dart -> abstract class

- article_model.dart -> generate from json you can using quicktype.io

- article_repository_implementation -> 

- news_api_service -> method using POST GET UPDATE DELETE

```
flutter pub run build_runner build
```

- core/usecase.dart

- feature/usecase/get_article.dart
    - based name 
