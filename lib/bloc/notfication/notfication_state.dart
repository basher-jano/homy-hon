part of 'notfication_bloc.dart';

 class NotficationState extends Equatable {
  const NotficationState();
  
  @override
  List<Object> get props => [];
}

 class NotficationInitial extends NotficationState {

 }
 class Loading extends NotficationState{}
 class Failure extends NotficationState{}
 class Success extends NotficationState{}
 class SuccesChangeState extends NotficationState{}
