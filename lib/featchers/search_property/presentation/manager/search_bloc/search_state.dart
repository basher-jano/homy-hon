part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class LoadingState extends SearchState {}

class SuccessState extends SearchState {}

class FailureState extends SearchState {
  final String errMsg;

  const FailureState(this.errMsg);
}
