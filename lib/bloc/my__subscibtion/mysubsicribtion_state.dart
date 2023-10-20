part of 'mysubsicribtion_bloc.dart';

 class MysubsicribtionState extends Equatable {
  const MysubsicribtionState();
  
  @override
  List<Object> get props => [];
}

 class MysubsicribtionInitial extends MysubsicribtionState {}
class Loading extends MysubsicribtionState{}
class Failure extends MysubsicribtionState{}
class Success extends MysubsicribtionState{}