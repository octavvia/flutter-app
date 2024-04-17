// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

import '../../core/errors/server_failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getTrendingMovies();
  }
}
