part of 'offices_cubit.dart';

abstract class OfficesState extends Equatable {
  const OfficesState();

  @override
  List<Object> get props => [];
}

class OfficesInitial extends OfficesState {}

class OfficesLoading extends OfficesState {}

class OfficesFailure extends OfficesState {
  final String errMessage;

  const OfficesFailure(this.errMessage);
}

class OfficesSuccess extends OfficesState {

  final OfficesModel;

  OfficesSuccess(this.OfficesModel);
}
