part of 'addproperty_bloc.dart';

class AddpropertyState extends Equatable {
  final ScreenState screenState;
  final Validate? validate;
  final bool? isRent;
  final ScreenNavigate? screenNavigate;
  final bool isLoading;
 final String ?error;
  final bool? isValdiate;
  final List<String>? governoratesList;
  final List<String>? regionList;
  const AddpropertyState(
      {this.screenState = ScreenState.initialized,
      this.isRent,
      this.error,
      this.validate,
      this.governoratesList,
      this.isLoading = false,
      this.regionList,
      this.isValdiate,
      this.screenNavigate});
  AddpropertyState copyWith(
      {ScreenState? screenState,
      List<String>? governoratesList,
      Validate? validate,
      bool? isRent,
      bool? isValidate,
      bool? isLoading,
      String? error,
      ScreenNavigate? screenNavigate,
      List<String>? regionList}) {
    return AddpropertyState(
      error: error??"some thing went wrong",
        validate: validate ?? null,
        isValdiate: isValdiate ?? isValdiate,
        regionList: regionList ?? this.regionList,
        isLoading: isLoading ?? false,
        screenState: screenState ?? ScreenState.initialized,
        isRent: isRent ?? this.isRent,
        governoratesList: governoratesList ?? this.governoratesList,
        screenNavigate: screenNavigate ?? this.screenNavigate);
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        error,
        validate,
        isValdiate,
        governoratesList,
        isLoading,
        screenState,
        isRent,
        screenNavigate,
        regionList
      ];
}
