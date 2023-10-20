part of 'wish_list_bloc.dart';

abstract class WishListState extends Equatable {
  const WishListState();

  @override
  List<Object> get props => [];
}

class WishListInitial extends WishListState {}

class WishListSuccess extends WishListState {}

class WishListLoading extends WishListState {}

class WishListFailure extends WishListState {
  final String errMsg;

  const WishListFailure({required this.errMsg});
}
