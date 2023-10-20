part of 'office_details_cubit.dart';

class OfficeDetailsState extends Equatable {
  const OfficeDetailsState();

  @override
  List<Object> get props => [];
}

class OfficeDetailsInitial extends OfficeDetailsState {}

class OfficeDetailsLoading extends OfficeDetailsState {}

class OfficeDetailsFailure extends OfficeDetailsState {}

class OfficeDetailsSuccess extends OfficeDetailsState {
  final OfficeDetailsModel officeDetailsModel;

  OfficeDetailsSuccess(this.officeDetailsModel);
}
