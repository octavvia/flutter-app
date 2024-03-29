import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constant/constant.dart';
import '../../models/article_model.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}

//  api method like GET POST PUT DELETE