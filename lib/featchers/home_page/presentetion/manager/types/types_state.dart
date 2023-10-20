part of 'types_cubit.dart';

abstract class TypesState extends Equatable {
  const TypesState();

  @override
  List<Object> get props => [];
}

class TypesInitial extends TypesState {}

class TypesLoading extends TypesState {}

class TypesFailure extends TypesState {}

class TypesSuccess extends TypesState {}
