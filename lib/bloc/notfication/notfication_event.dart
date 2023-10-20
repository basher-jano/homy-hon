// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notfication_bloc.dart';

class NotficationEvent extends Equatable {
  const NotficationEvent();

  @override
  List<Object> get props => [];
}

class GetNotficationEvent extends NotficationEvent {}

class UpdateNotficationState extends NotficationEvent {
  int id;
  int index;
  UpdateNotficationState({required this.id, required this.index});
}
