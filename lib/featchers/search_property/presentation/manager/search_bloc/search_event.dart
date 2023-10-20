part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInitialEvent extends SearchEvent {}

class SearchForOfficeEvent extends SearchEvent {
  final String officeName;

  const SearchForOfficeEvent(this.officeName);
}

class GetAllPropertiesEvent extends SearchEvent {}

class GetAllOfficesEvent extends SearchEvent {}
