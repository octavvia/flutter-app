import 'package:flutter_tdd/domain/repositories/weather_repository.dart';
import 'package:flutter_tdd/domain/usecase/get_current_weather.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;


@GenerateMocks(
  [
   WeatherRepository,
  //  WeatherRemoteDataSource,
  //  GetCurrentWeatherUseCase
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)

void main() {}