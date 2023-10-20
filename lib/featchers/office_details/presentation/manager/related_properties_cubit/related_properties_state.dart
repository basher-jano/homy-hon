part of 'related_properties_cubit.dart';

class RelatedPropertiesState extends Equatable {
  const RelatedPropertiesState();

  @override
  List<Object> get props => [];
}

class RelatedPropertiesInitial extends RelatedPropertiesState {}

class RelatedPropertiesLoading extends RelatedPropertiesState {}

class RelatedPropertiesIFailure extends RelatedPropertiesState {
  final String? errMessage;

  RelatedPropertiesIFailure(this.errMessage);
}

class RelatedPropertiesSuccess extends RelatedPropertiesState {
  final MyProperties? myProperties;

  RelatedPropertiesSuccess(this.myProperties);
}
