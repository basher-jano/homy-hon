part of 'my_properties_cubit.dart';

@immutable
abstract class MyPropertiesState {}

class MyPropertiesInitial extends MyPropertiesState {}

class MyPropertiesLoading extends MyPropertiesState {}

class MyPropertiesSuccess extends MyPropertiesState {
  final MyProperties;

  MyPropertiesSuccess(this.MyProperties);
}

class MyPropertiesFailure extends MyPropertiesState {
  final errmessage;

  MyPropertiesFailure(this.errmessage);
}

class TypedPropertiesInitial extends MyPropertiesState {}

class TypedPropertiesLoading extends MyPropertiesState {}

class TypedPropertiesSuccess extends MyPropertiesState {}

class TypedPropertiesFailure extends MyPropertiesState {}

class DeletePropertyLoading extends MyPropertiesState {}

class DeletePropertyFailure extends MyPropertiesState {}

class DeletePropertySuccess extends MyPropertiesState {}
