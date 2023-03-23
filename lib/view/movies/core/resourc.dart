abstract class Resource<T> {
  map(Function(dynamic v) param0) {}
}

class Success<T> extends Resource<T> {
  final T? date;
  Success({this.date});
}

class Error<T> extends Resource<T> {
  final String? message;
  Error({this.message});
}

class Loading<T> extends Resource<T> {}
