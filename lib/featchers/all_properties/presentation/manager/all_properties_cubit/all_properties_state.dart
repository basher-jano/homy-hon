part of 'all_properties_cubit.dart';

@immutable
abstract class AllPropertiesState {}

class AllPropertiesInitial extends AllPropertiesState {}

class AllPropertiesLoading extends AllPropertiesState {}

class AllPropertiesSuccess extends AllPropertiesState {}

class AllPropertiesFailure extends AllPropertiesState {}
