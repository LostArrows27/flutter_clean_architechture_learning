import 'package:flutter_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_app/features/daily_news/data/repository/article_repository.dart';
import 'package:flutter_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // dio
  sl.registerSingleton<Dio>(Dio());

  // dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // use cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // bloc
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
