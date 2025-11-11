part of 'history_search_cubit.dart';

@immutable
sealed class HistorySearchState {}

final class HistorySearchInitial extends HistorySearchState {}
final class HistorySearchLoaded extends HistorySearchState {
  final List<String> history;

  HistorySearchLoaded({required this.history});
}
final class HistorySearchEmpty extends HistorySearchState {
  final List<String> history;
  HistorySearchEmpty({required this.history});
}
