part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsSuccess extends CommentsState {
  final Comments comments;

  const CommentsSuccess(this.comments);
}

class CommentsFailure extends CommentsState {
  final String errMsg;

  const CommentsFailure(this.errMsg);
}

class AddCommentSuccess extends CommentsState {
  final AddComment addComment;

  const AddCommentSuccess(this.addComment);
}

class AddCommentFailure extends CommentsState {
  final String errMsg;

  const AddCommentFailure(this.errMsg);
}

class AddCommentLoading extends CommentsState {}
