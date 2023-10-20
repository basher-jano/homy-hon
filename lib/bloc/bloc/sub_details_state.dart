part of 'sub_details_bloc.dart';

class SubDetailsState extends Equatable {
  const SubDetailsState();

  @override
  List<Object> get props => [];
}

class SubDetailsInitial extends SubDetailsState {}

class Loading extends SubDetailsState {}

class Success extends SubDetailsState {}

class Failure extends SubDetailsState {}
