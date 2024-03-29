import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';import 'config/routes/routes.dart';
import 'config/theme/theme.dart';
import 'features/article/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'features/article/presentation/bloc/article/remote/remote_article_event.dart';
import 'features/article/presentation/pages/home/daily_news.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const DailyNews()
      ),
    );
  }
}
