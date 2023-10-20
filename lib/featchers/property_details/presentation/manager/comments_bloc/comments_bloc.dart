import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/property_details/data/models/add_comment_model.dart';
import 'package:homy_hon/featchers/property_details/data/models/comments_model.dart';
import 'package:homy_hon/featchers/property_details/data/repos/comments_repo/comments_repo.dart';
import 'package:homy_hon/featchers/property_details/data/repos/comments_repo/comments_repo_impl.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  Comments? comments;

  bool? deleteCommentSuccess;
  bool deleteCommentLoading = false;
  String? deleteCommentMessage;

  CommentsBloc(CommentsRepoImpl commentsRepoImpl) : super(CommentsInitial()) {
    final CommentsRepo commentsRepo = commentsRepoImpl;
    on<CommentsEvent>((event, emit) async {
      if (event is GetCommentsEvent) {
        emit(CommentsLoading());
        var reslut = await commentsRepo.getComments(event.id);
        reslut.fold(
          (l) => emit(CommentsFailure(l)),
          (r) {
            comments = r;
            emit(CommentsSuccess(r));
          },
        );
      }
      if (event is AddCommentEvent) {
        emit(AddCommentLoading());
        comments = null;
        var result = await commentsRepo.addComment(event.id, event.content);
        result.fold(
          (l) => emit(AddCommentFailure(l)),
          (r) => emit(AddCommentSuccess(r)),
        );
      }
      if (event is DeleteCommentEvent) {
        deleteCommentLoading = true;
        var result = await commentsRepo.deleteComment(event.id);
        result.fold(
          (l) {
            deleteCommentLoading = false;
            deleteCommentSuccess = true;
            deleteCommentMessage = l;
            return l;
          },
          (r) {
            deleteCommentLoading = false;
            deleteCommentSuccess = false;
            deleteCommentMessage = r;
            return r;
          },
        );
      }
    });
  }
}
