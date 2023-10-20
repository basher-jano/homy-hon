part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterSuccess extends FilterState {
  final Properties properties;

  const FilterSuccess(this.properties);
}

class FilterFailure extends FilterState {
  final String errMsg;

  const FilterFailure(this.errMsg);
}

class GovernoratesSuccess extends FilterState {
  final Governorates governorates;

  const GovernoratesSuccess(this.governorates);
}

class GovernoratesFailure extends FilterState {
  final String errMsg;

  const GovernoratesFailure(this.errMsg);
}

class RegionsSuccess extends FilterState {
  final Regions regions;

  const RegionsSuccess(this.regions);
}

class RegionsFailure extends FilterState {
  final String errMsg;

  const RegionsFailure(this.errMsg);
}
