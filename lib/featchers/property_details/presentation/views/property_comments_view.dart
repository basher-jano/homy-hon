import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/comments_bloc/comments_bloc.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/comments_widgets/custom_comment_textfield.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/comments_widgets/custom_comments_list_view.dart';

class PropertyCommentsView extends StatelessWidget {
  const PropertyCommentsView({super.key, required this.propertyId});
  final int propertyId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: 'Comments', arrow_back: true),
            Expanded(
              child: BlocBuilder<CommentsBloc, CommentsState>(
                bloc: context.read<CommentsBloc>().comments == null
                    ? (context.read<CommentsBloc>()
                      ..add(GetCommentsEvent(propertyId)))
                    : null,
                builder: (context, state) {
                  if (context.read<CommentsBloc>().comments != null) {
                    return CustomCommentsListView(
                        propertyId: propertyId,
                        comments: context.read<CommentsBloc>().comments!);
                  } else {
                    if (state is CommentsSuccess) {
                      return CustomCommentsListView(
                        comments: state.comments,
                        propertyId: propertyId,
                      );
                    } else if (state is CommentsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CommentsFailure) {
                      return Center(
                        child: Text(
                          state.errMsg,
                          style: const TextStyle(color: kBlack),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }
                },
              ),
            ),
            CustomCommentTextField(propertyId: propertyId),
          ],
        ),
      ),
    );
  }
}
