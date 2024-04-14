
import 'package:dartz/dartz.dart';

import '../models/movie.dart';

abstract class MovieRemoteDataSource {

  Future<List<MovieModel>> getTrendingMovies();

  Future<List<MovieModel>> searchMovies(String query);

  Future<List<MovieModel>> getPopularMovies();
}