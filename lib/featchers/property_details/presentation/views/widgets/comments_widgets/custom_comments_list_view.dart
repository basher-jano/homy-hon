import 'package:flutter/material.dart';
import 'package:homy_hon/featchers/property_details/data/models/comments_model.dart';

import 'custom_comments_list_view_item.dart';

class CustomCommentsListView extends StatelessWidget {
  const CustomCommentsListView({
    super.key,
    required this.comments,
    required this.propertyId,
  });
  final Comments comments;
  final int propertyId;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: comments.list.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: CustomComment(
          PropertyId: propertyId,
          commentId: comments.list[index].id,
          accountId: comments.list[index].accountId,
          content: comments.list[index].content,
          date: comments.list[index].postAt,
          name: comments.list[index].accountName,
          img: comments.list[index].accountImg,
        ),
      ),
    );
  }
}
