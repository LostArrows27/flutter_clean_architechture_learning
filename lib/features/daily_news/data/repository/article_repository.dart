import 'package:flutter_app/core/constants/constants.dart';
import 'package:flutter_app/core/resources/data_state.dart';
import '../data_sources/remote/news_api_service.dart';
import 'package:flutter_app/features/daily_news/domain/entities/article.dart';
import 'package:flutter_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          country: countryQuery, apiKey: newsApiKey, category: categoryQuery);

      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data);
      }

      return DataError(DioException(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        type: DioExceptionType.badResponse,
        requestOptions: httpResponse.response.requestOptions,
      ));
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
