abstract class DataState<T> {
  final T? data;
  final String? error;

  DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T? data) : super(data as T, null);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(String error) : super(null, error);
}
