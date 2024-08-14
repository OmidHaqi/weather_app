abstract class DateState<T> {
  final T? data;
  final String? error;

  DateState(this.data, this.error);
}

class DataSuccess<T> extends DateState<T> {
  DataSuccess(T? data) : super(data as T, null);
}

class DataFailed<T> extends DateState<T> {
  DataFailed(String error) : super(null, error);
}
