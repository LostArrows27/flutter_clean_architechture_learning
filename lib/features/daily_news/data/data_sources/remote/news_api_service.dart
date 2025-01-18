import 'package:flutter_app/core/constants/constants.dart';
import 'package:flutter_app/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIbaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getArticles(
    @Query('country') String? country,
    @Query('apiKey') String? apiKey,
    @Query('category') String? category,
  );

  
}
