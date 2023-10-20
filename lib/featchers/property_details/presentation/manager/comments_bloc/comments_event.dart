part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class GetCommentsEvent extends CommentsEvent {
  final int id;

  const GetCommentsEvent(this.id);
}

class AddCommentEvent extends CommentsEvent {
  final int id;
  final String content;

  const AddCommentEvent(this.id, this.content);
}

class DeleteCommentEvent extends CommentsEvent {
  final int id;

  const DeleteCommentEvent(this.id);
}
