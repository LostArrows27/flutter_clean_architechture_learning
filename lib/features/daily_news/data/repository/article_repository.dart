import 'package:flutter_app/core/resources/data_state.dart';
import 'package:flutter_app/features/daily_news/domain/entities/article.dart';
import 'package:flutter_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleEntity>>> getArticles() {
    // TODO: implement getArticles
    throw UnimplementedError();
  }
}
