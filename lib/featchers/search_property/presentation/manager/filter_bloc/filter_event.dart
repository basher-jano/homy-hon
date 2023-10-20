part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class ApplyFilterEvent extends FilterEvent {
  final FilterModel filterModel;

  const ApplyFilterEvent(this.filterModel);
}

class FilterInitialEvent extends FilterEvent {}

class ChooseGovernorates extends FilterEvent {
  final int id;

  const ChooseGovernorates(this.id);
}
