part of 'property_details_bloc.dart';

abstract class PropertyDetailsState extends Equatable {
  const PropertyDetailsState();

  @override
  List<Object> get props => [];
}

class PropertyDetailsInitial extends PropertyDetailsState {}

class PropertyDetailsLoading extends PropertyDetailsState {}

class PropertyDetailsSuccess extends PropertyDetailsState {
  final Property property;
  final bool isLiked;
  const PropertyDetailsSuccess({required this.property, required this.isLiked});
}

class PropertyDetailsFailure extends PropertyDetailsState {
  final String errMsg;

  const PropertyDetailsFailure(this.errMsg);
}
