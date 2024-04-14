import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movie/data/datasources/movie_remote_data_source.dart';
import 'package:movie/data/datasources/remote/movie_remote_data_source.dart';
import 'package:movie/data/repositories/movie_repository.dart';
import 'package:movie/domain/repositories/movie_repository.dart';
import 'package:movie/domain/usecases/get_popular_movie.dart';
import 'package:movie/domain/usecases/get_trending_movie.dart';
import 'package:movie/domain/usecases/search_movie.dart';

import 'presentation/bloc/popular_movie/popular_bloc.dart';
import 'presentation/bloc/search_movie/search_bloc.dart';
import 'presentation/bloc/trending_movie/trending_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // Bloc
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));

  // Repositories
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: getIt()));

  // Http service
  getIt.registerLazySingleton(() => http.Client());
}
