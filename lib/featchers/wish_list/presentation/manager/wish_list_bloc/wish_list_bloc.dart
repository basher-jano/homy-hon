import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';
import 'package:homy_hon/featchers/wish_list/data/repos/wish_list_repo.dart';
import 'package:homy_hon/featchers/wish_list/data/repos/wish_list_repo_impl.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  Properties? wishList;
  WishListBloc(WishListRepoImpl wishListRepoImpl) : super(WishListInitial()) {
    final WishListRepo wishListRepo = wishListRepoImpl;
    on<WishListEvent>((event, emit) async {
      if (event is WishListInetialEvent) {
        emit(WishListLoading());
        var result = await wishListRepo.getWishList();

        result.fold(
          (l) {
            wishList = null;
            emit(WishListFailure(errMsg: l));
          },
          (r) {
            wishList = r;
            emit(WishListSuccess());
          },
        );
      }
    });
  }
}
