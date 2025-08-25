part of 'getquotes_cubit.dart';

abstract class GetquotesState {}

class GetquotesInitial extends GetquotesState {}

class GetquotesLoading extends GetquotesState {}

class GetquotesLoaded extends GetquotesState {
  final QuoteEntity quote;
  GetquotesLoaded({required this.quote});
}

class GetquotesError extends GetquotesState {
  final String message;
  GetquotesError({required this.message});
}
