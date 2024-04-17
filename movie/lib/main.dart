import 'package:flutter/material.dart';
import 'package:movie/injection_container.dart';
import 'package:movie/presentation/bloc/popular_movie/popular_bloc.dart';
import 'package:movie/presentation/bloc/popular_movie/popular_event.dart';
import 'package:movie/presentation/bloc/search_movie/search_bloc.dart';
import 'package:movie/presentation/bloc/trending_movie/trending_bloc.dart';
import 'package:movie/presentation/bloc/trending_movie/trending_event.dart';
import 'package:movie/presentation/pages/home.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
          ),
          BlocProvider(
            create: (context) =>
                getIt<TrendingMoviesBloc>()..add(FetchTrendingMovies()),
          ),
          BlocProvider(
            create: (context) => getIt<SearchMoviesBloc>(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
