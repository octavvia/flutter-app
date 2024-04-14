import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_popular_movie.dart';
import 'popular_event.dart';
import 'popular_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc({required this.getPopularMovies})
      : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
          (failure) => emit(PopularMoviesError(failure.toString())),
          (movies) => emit(PopularMoviesLoaded(movies)));
    });
  }
}
