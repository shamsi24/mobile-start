import 'package:equatable/equatable.dart';
import 'package:{{name.snakeCase}}/data/exception/error.dart';

// The base class for all states, extending Equatable to support value comparison.
abstract class GenericState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Represents the initial state of the application or process, typically before any action is taken.
class Initial extends GenericState {}

// Represents a state where some process is currently in progress (e.g., loading state).
class InProgress extends GenericState {}

// Represents a successful state where a value (of generic type T) is returned after an operation.
class Success<T> extends GenericState {
  final T? value; // The result or data that is returned upon success.

  Success({this.value});

  // Ensures that the value is considered when comparing instances of Success.
  @override
  List<Object?> get props => [value];
}

// Represents a failure state where an error occurred during an operation.
class Failure extends GenericState {
  final ErrorMessage
      error; // The error message or object containing details about the failure.

  Failure(this.error);

  // Ensures that the error is considered when comparing instances of Failure.
  @override
  List<Object?> get props => [error];
}
