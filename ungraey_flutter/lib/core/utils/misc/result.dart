/// A functional result monad wrapping success [T] or failure [Exception].
sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get dataOrNull => switch (this) {
        Success(:final data) => data,
        Failure() => null,
      };

  String? get errorOrNull => switch (this) {
        Success() => null,
        Failure(:final message) => message,
      };

  static Result<T> success<T>(T data) => Success(data);
  static Result<T> failure<T>(String message, [Object? exception]) =>
      Failure(message, exception);

  static Future<Result<T>> tryRunAsync<T>(Future<T> Function() block) async {
    try {
      final res = await block();
      return Success(res);
    } catch (e) {
      return Failure(e.toString(), e);
    }
  }

  static Result<T> tryRun<T>(T Function() block) {
    try {
      return Success(block());
    } catch (e) {
      return Failure(e.toString(), e);
    }
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  final Object? exception;
  const Failure(this.message, [this.exception]);
}
