import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:homy_hon/core/utils/app_enum.dart';
import 'package:homy_hon/featchers/Login/data/repos/add_property_repo.dart';
import 'package:homy_hon/featchers/search_property/data/models/parms/add_farm_parms.dart';
import 'package:homy_hon/featchers/search_property/data/models/parms/add_property_parms.dart';
import 'package:homy_hon/featchers/search_property/data/models/parms/add_shop_parms.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_governorates_repo/get_governorates_repo.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_governorates_repo/get_governorates_repo_impl.dart';

part 'addproperty_event.dart';
part 'addproperty_state.dart';

class AddpropertyBloc extends Bloc<AddpropertyEvent, AddpropertyState> {
  bool isRent = false;
  AddPropertyPrams addPropertyPrams = AddPropertyPrams();
  AddShopPrams addShopPrams = AddShopPrams();
  AddFarmPrams addFarmPrams = AddFarmPrams();
  String? regionvalue;
  String? government;
  GetGovernoratesRepoImpl getGovernoratesRepoImpl;
  List<String> idList = [];
  List<String> photoList = [];
  List<String> countryState = ["midan", "damas", "zahra"];
  AddpropertyBloc(
    this.getGovernoratesRepoImpl,
  ) : super(const AddpropertyState()) {
    on<AddpropertyEvent>((event, emit) async {
      if (event is IsRentEvent) {
        emit(state.copyWith(
            isRent: addPropertyPrams.isRent == 1 ? true : false));
      }
      if (event is NavigateEvent) {
        emit(state.copyWith(screenNavigate: event.screenNavigate));
      }
      if (event is GetGovernoratesEvent) {
        var result = await getGovernoratesRepoImpl.getGovernorates();
        result.fold(
          (l) => emit(state.copyWith(governoratesList: [])),
          (r) {
            List<String> list = [];
            for (var element in r.list.values) {
              list.add(element);
            }
            emit(state.copyWith(governoratesList: list));
          },
        );
      }
      if (event is GetRegionsEvent) {
        // emit(state.copyWith(isLoading: true, regionList: []));
        var result = await getGovernoratesRepoImpl.getRegions(event.id);
        result.fold((l) => emit(state.copyWith(regionList: [])), (r) {
          List<String> list = [];
          idList = [];
          for (var element in r.list.values) {
            list.add(element);
          }

          for (var element in r.list.keys) {
            idList.add(element);
          }
          print(idList);
          emit(state.copyWith(regionList: list));
        });
      }
      if (event is GetRegionId) {
        addPropertyPrams.regionId = idList[event.index];
        addFarmPrams.regionId = idList[event.index];
        addShopPrams.regionId = idList[event.index];
        print(addPropertyPrams.regionId);
      }
      if (event is UploadImageEvent) {
        (await AddPropertyRepo.UploadPhoto(event.image!)).fold((l) => null,
            (r) {
          print(photoList);
          photoList.add(r);
          print(photoList);
          print(addPropertyPrams.selectedPhoto);
        });
      }
      if (event is AddPropertysevent) {
        emit(state.copyWith(isLoading: true));

        if (state.screenNavigate == ScreenNavigate.house) {
          (await AddPropertyRepo.addProperty(addPropertyPrams)).fold((l) {
            if(l is String){
emit(state.copyWith(screenState: ScreenState.error,error: l,isLoading: false));

}
else{
  emit(state.copyWith(screenState: ScreenState.error,isLoading: false));
}
         ;
          }, (r) {
            emit(state.copyWith(screenState: ScreenState.succes));
          });
        }
        if (state.screenNavigate == ScreenNavigate.shop) {
          (await AddPropertyRepo.addShopProperty(addShopPrams)).fold(
              (l) {
if(l is String){
emit(state.copyWith(screenState: ScreenState.error,error: l));

}
else{
  emit(state.copyWith(screenState: ScreenState.error));
}
              } , (r) {
            emit(state.copyWith(screenState: ScreenState.succes));
          });
        }
        if (state.screenNavigate == ScreenNavigate.farm) {
          (await AddPropertyRepo.addFarmProperty(addFarmPrams)).fold(
              (l) {
                if(l is String){
emit(state.copyWith(screenState: ScreenState.error,error: l));

}
else{
  emit(state.copyWith(screenState: ScreenState.error));
}
              }, (r) {
            emit(state.copyWith(screenState: ScreenState.succes));
          });
        }
      }
      if (event is IsValidateEvent) {
        if (isValidateFunc()) {
          emit(state.copyWith(validate: Validate.truee));
        } else {
          print("false");
          emit(state.copyWith(validate: Validate.falsee));
        }
      }
      if (event is IsValidateFarmDetailsEvent) {
        if (isValidateFunc()) {
          emit(state.copyWith(validate: Validate.truee));
        } else {
          print("false");
          emit(state.copyWith(validate: Validate.falsee));
        }
      }
      if (event is deletePhotoFromServer) {}
    });
  }
  bool isValidateFunc() {
    if (addPropertyPrams.isRent == null ||
        addPropertyPrams.description == null ||
        addPropertyPrams.latitude == null ||
        addPropertyPrams.langtude == null ||
        addPropertyPrams.regionId == null) {
      print(addPropertyPrams.description);
      return false;
    } else {
      print(addPropertyPrams.description);
      return true;
    }
  }

  bool isValidateHouseDetails() {
    if (addPropertyPrams.price == null ||
        addPropertyPrams.space == null ||
        addPropertyPrams.bedRoomsNumber == null ||
        addPropertyPrams.bathRoomsNumber == null ||
        addPropertyPrams.floorNumber == null) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidateShopDetails() {
    if (addShopPrams.price == null || addShopPrams.space == null) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidateFarmDetails() {
    if (addFarmPrams.price == null ||
        addFarmPrams.space == null ||
        addFarmPrams.bedRoomsNumber == null ||
        addFarmPrams.bathRoomsNumber == null ||
        addFarmPrams.poolSpace == null ||
        addFarmPrams.poolDepth == null ||
        addFarmPrams.poolDepth == null) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidateUploadShop() {
    if (addShopPrams.isFrunched == null) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidateUploadHouse() {
    if (addPropertyPrams.isFrunched == null ||
        addPropertyPrams.greenOrTabo == null ||
        addPropertyPrams.hasCladding == null) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidateUploadFarm() {
    if (addFarmPrams.isFrunched == null ||
        addFarmPrams.hasParking == null ||
        addFarmPrams.hasWaterWell == null ||
        addFarmPrams.hasStadium == null) {
      return false;
    } else {
      return true;
    }
  }
}
