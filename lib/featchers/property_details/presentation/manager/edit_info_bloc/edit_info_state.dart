part of 'edit_info_bloc.dart';

abstract class EditInfoState extends Equatable {
  const EditInfoState();

  @override
  List<Object> get props => [];
}

class EditInfoInitial extends EditInfoState {}

class EditInfoLoading extends EditInfoState {
  EditInfoLoading();
}

class EditInfoSuccess extends EditInfoState {
  final String message;

  EditInfoSuccess({required this.message});
}

class EditInfoFailure extends EditInfoState {
  final String message;

  EditInfoFailure({required this.message});
}

class DeleteImageSuccess extends EditInfoState {
  final String message;
  int? index;
  DeleteImageSuccess({required this.message, this.index});
}

class DeleteImageFailure extends EditInfoState {
  final String message;
  int? index;

  DeleteImageFailure({required this.message, this.index});
}

class DeleteImageLoading extends EditInfoState {
  int? index;
  DeleteImageLoading({this.index});
}

class PickImageSuccess extends EditInfoState {
  final File image;

  PickImageSuccess(this.image);
}

class UploadImageLoading extends EditInfoState {}

class UploadImageSuccess extends EditInfoState {
  final String message;

  const UploadImageSuccess(this.message);
}

class UploadImageFailure extends EditInfoState {
  final String message;

  const UploadImageFailure(this.message);
}
