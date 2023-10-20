import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';
import 'package:homy_hon/featchers/property_details/data/repos/property_details_repo/property_details_repo.dart';
import 'package:homy_hon/featchers/property_details/data/repos/property_details_repo/property_details_repo_impl.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';
import 'package:homy_hon/featchers/search_property/presentation/manager/search_bloc/search_bloc.dart';

part 'property_details_event.dart';
part 'property_details_state.dart';

class PropertyDetailsBloc
    extends Bloc<PropertyDetailsEvent, PropertyDetailsState> {
  Property? property;
  Properties? wishList;

  bool isLiked = false;
  bool isLikedLoading = false;
  PropertyDetailsBloc(PropertyDetailsRepoImple propertyDetailsRepoImple)
      : super(PropertyDetailsInitial()) {
    final PropertyDetailsRepo propertyDetailsRepo = propertyDetailsRepoImple;
    on<PropertyDetailsEvent>((event, emit) async {
      if (event is PropertyDetailsInitialEvent) {
        emit(PropertyDetailsLoading());

        var result = await propertyDetailsRepo.getPropertyDetails(event.id);
        var wishListResult = await propertyDetailsRepo.getWishList();

        result.fold(
          (l) => emit(PropertyDetailsFailure(l)),
          (rr) {
            property = rr;
            isLiked = false;
            wishListResult.fold(
              (l) {
                isLiked = false;
              },
              (r) {
                wishList = r;
                if (r.list.isNotEmpty) {
                  for (var i = 0; i < r.list.length; i++) {
                    if (rr.list.property.id == r.list[i].id) {
                      isLiked = true;
                    }
                  }
                }
              },
            );
            emit(PropertyDetailsSuccess(property: rr, isLiked: isLiked));
          },
        );
      }
      if (event is CheckWishList) {
        var wishListResult = await propertyDetailsRepo.getWishList();
        // isLikedLoading = true;
        wishListResult.fold(
          (l) {
            isLiked = false;
          },
          (r) {
            wishList = r;
            isLiked = false;
            if ((r.list.isNotEmpty)) {
              for (var i = 0; i < r.list.length; i++) {
                if (property!.list.property.id == r.list[i].id) {
                  isLiked = true;
                  emit(const PropertyDetailsFailure("errMsg"));
                  emit(PropertyDetailsSuccess(
                      property: property!, isLiked: true));
                  break;
                }
              }
            }
            emit(const PropertyDetailsFailure("errMsg"));
            emit(PropertyDetailsSuccess(property: property!, isLiked: false));
          },
        );
      }
      if (event is AddToWishListEvent) {
        var result = await propertyDetailsRepo.addToWishList(event.id);
        result.fold((l) {
          print(l);
          isLiked = false;
          emit(PropertyDetailsSuccess(property: property!, isLiked: false));
        }, (r) {
          print(r);
          isLiked = true;
          emit(PropertyDetailsSuccess(property: property!, isLiked: true));
        });
      }
    });
  }
}
