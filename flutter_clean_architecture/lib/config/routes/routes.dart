// page for routes management
import 'package:flutter/material.dart';

// import '../../features/article/domain/entities/article.dart';
import '../../features/article/domain/entities/article.dart';
import '../../features/article/presentation/pages/article_detail/article_detail.dart';
import '../../features/article/presentation/pages/home/daily_news.dart';
import '../../features/article/presentation/pages/saved_article/saved_article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/ArticleDetails':
        return _materialRoute(
            ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
