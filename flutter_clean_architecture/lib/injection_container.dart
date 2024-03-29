import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/article/data/data_sources/local/app_database_local.dart';
import 'features/article/data/data_sources/remote/news_api_service.dart';
import 'features/article/data/repository/article_repository_implementation.dart';
import 'features/article/domain/repository/article_repository.dart';
import 'features/article/domain/usecases/delete_remove_article.dart';
import 'features/article/domain/usecases/get_article.dart';
import 'features/article/domain/usecases/get_save_article.dart';
import 'features/article/domain/usecases/post_save_article.dart';
import 'features/article/presentation/bloc/article/local/local_article_bloc.dart';
import 'features/article/presentation/bloc/article/remote/remote_article_bloc.dart';
final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl(),sl())
  );
  
  //UseCases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl())
  );

  sl.registerSingleton<GetSavedArticleUseCase>(
    GetSavedArticleUseCase(sl())
  );

  sl.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(sl())
  );
  
  sl.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(sl())
  );


  //Bloc
  sl.registerFactory<RemoteArticlesBloc>(
    ()=> RemoteArticlesBloc(sl())
  );

  sl.registerFactory<LocalArticleBloc>(
    ()=> LocalArticleBloc(sl(),sl(),sl())
  );


}