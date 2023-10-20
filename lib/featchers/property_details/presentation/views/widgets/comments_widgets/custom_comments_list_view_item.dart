import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/comments_bloc/comments_bloc.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/textStyles.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';

class CustomComment extends StatelessWidget {
  const CustomComment({
    super.key,
    required this.commentId,
    required this.content,
    required this.date,
    required this.name,
    required this.img,
    required this.accountId,
    required this.PropertyId,
  });
  final int commentId;
  final int accountId;
  final int PropertyId;
  final String content;
  final String date;
  final String name;
  final String? img;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGrey.withOpacity(0.1),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CustomImage(
                image: img != null
                    ? img!
                    : "https://static.vecteezy.com/system/resources/previews/001/840/618/original/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg",
                width: 40,
                height: 40,
                radius: 30,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.textStyle18
                      .copyWith(color: kBlack, fontWeight: FontWeight.w900),
                ),
                Text(content, style: TextStyles.textStyle16),
                Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: kGrey),
                    ),
                    const SizedBox(width: 15),
                    accountId == 27
                        ? BlocListener<CommentsBloc, CommentsState>(
                            listener: (context, state) {
                              if (context
                                      .read<CommentsBloc>()
                                      .deleteCommentMessage !=
                                  null) {
                                print(context
                                    .read<CommentsBloc>()
                                    .deleteCommentMessage);
                              }
                            },
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<CommentsBloc>()
                                    .add(DeleteCommentEvent(commentId));
                                context
                                    .read<CommentsBloc>()
                                    .add(GetCommentsEvent(PropertyId));
                              },
                              child: Text(
                                'Delete',
                                style: TextStyles.textStyle16
                                    .copyWith(color: Colors.red),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
