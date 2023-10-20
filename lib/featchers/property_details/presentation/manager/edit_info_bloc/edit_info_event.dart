part of 'edit_info_bloc.dart';

abstract class EditInfoEvent extends Equatable {
  const EditInfoEvent();

  @override
  List<Object> get props => [];
}

class EditPropertyInfoEvent extends EditInfoEvent {
  final String name;
  final String content;
  final String propertyType;
  final int propertyId;

  const EditPropertyInfoEvent(
      this.name, this.content, this.propertyType, this.propertyId);
}

class DeletePropertyImageEvent extends EditInfoEvent {
  final String image;
  final String propertyType;
  final int propertyId;
  final int index;
  const DeletePropertyImageEvent(
      this.image, this.propertyType, this.propertyId, this.index);
}

class PickImageEvent extends EditInfoEvent {
  final File image;

  const PickImageEvent(this.image);
}

class UploadImageEvent extends EditInfoEvent {
  final File image;
  final String propertyType;
  final int propertyId;

  const UploadImageEvent({
    required this.image,
    required this.propertyId,
    required this.propertyType,
  });
}
