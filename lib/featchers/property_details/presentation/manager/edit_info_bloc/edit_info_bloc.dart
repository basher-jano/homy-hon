import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/property_details/data/repos/edit_property_repo/edit_property_repo.dart';
import 'package:homy_hon/featchers/property_details/data/repos/edit_property_repo/edit_property_repo_impl.dart';

part 'edit_info_event.dart';
part 'edit_info_state.dart';

class EditInfoBloc extends Bloc<EditInfoEvent, EditInfoState> {
  EditInfoBloc(EditPropertyRepoImpl editPropertyRepoImpl)
      : super(EditInfoInitial()) {
    EditPropertyRepo editPropertyRepo = editPropertyRepoImpl;
    on<EditInfoEvent>((event, emit) async {
      if (event is EditPropertyInfoEvent) {
        String propertyType;
        if (event.propertyType == 'House') {
          propertyType = 'house';
        } else if (event.propertyType == 'Shop') {
          propertyType = 'shop';
        } else {
          propertyType = 'farm';
        }

        emit(EditInfoLoading());
        var result = await editPropertyRepo.editPropertyInfo(
            event.propertyId, event.name, event.content, propertyType);
        result.fold(
          (l) => emit(EditInfoFailure(message: l)),
          (r) => emit(EditInfoSuccess(message: r)),
        );
      }
      if (event is DeletePropertyImageEvent) {
        String propertyType;
        if (event.propertyType == 'House') {
          propertyType = 'house';
        } else if (event.propertyType == 'Shop') {
          propertyType = 'shop';
        } else {
          propertyType = 'farm';
        }
        emit(DeleteImageLoading(index: event.index));
        var result = await editPropertyRepo.deletePropertyImage(
          id: event.propertyId,
          image: event.image,
          propertyType: propertyType,
        );
        result.fold(
          (l) => emit(DeleteImageFailure(message: l, index: event.index)),
          (r) => emit(DeleteImageSuccess(message: r, index: event.index)),
        );
      }
      if (event is PickImageEvent) {
        emit(EditInfoLoading());
        emit(PickImageSuccess(event.image));
      }
      if (event is UploadImageEvent) {
        String propertyType;
        if (event.propertyType == 'House') {
          propertyType = 'house';
        } else if (event.propertyType == 'Shop') {
          propertyType = 'shop';
        } else {
          propertyType = 'farm';
        }

        emit(UploadImageLoading());
        var result = await editPropertyRepo.uploadImage(
          id: event.propertyId,
          image: event.image,
          propertyType: propertyType,
        );
        result.fold(
          (l) => emit(UploadImageFailure(l)),
          (r) => emit(UploadImageSuccess(r)),
        );
      }
    });
  }
}
