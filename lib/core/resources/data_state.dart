import 'package:dio/dio.dart';

/// wrap network call result
abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data, null);
}

class DataError<T> extends DataState<T> {
  const DataError(DioException error) : super(null, error);
}
