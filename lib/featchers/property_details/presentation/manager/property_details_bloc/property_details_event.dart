part of 'property_details_bloc.dart';

abstract class PropertyDetailsEvent extends Equatable {
  const PropertyDetailsEvent();

  @override
  List<Object> get props => [];
}

class PropertyDetailsInitialEvent extends PropertyDetailsEvent {
  final int id;

  const PropertyDetailsInitialEvent(this.id);
}

class CheckWishList extends PropertyDetailsEvent {}

class AddToWishListEvent extends PropertyDetailsEvent {
  final int id;

  const AddToWishListEvent(this.id);
}
