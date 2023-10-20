part of 'newest_property_cubit.dart';

abstract class NewestPropertyState extends Equatable {
  const NewestPropertyState();

  @override
  List<Object> get props => [];
}

class NewestPropertyInitial extends NewestPropertyState {}

class NewestPropertyLoading extends NewestPropertyState {}

class NewestPropertyFailure extends NewestPropertyState {}

class NewestPropertySuccess extends NewestPropertyState {}
