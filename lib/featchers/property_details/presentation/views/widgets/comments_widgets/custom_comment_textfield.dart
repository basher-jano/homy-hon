import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/comments_bloc/comments_bloc.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';

class CustomCommentTextField extends StatelessWidget {
  const CustomCommentTextField({
    super.key,
    required this.propertyId,
  });
  final int propertyId;
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return TextField(
      textAlignVertical: TextAlignVertical.center,
      cursorColor: kDarkBlue,
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomImage(
            image:
                "https://static.vecteezy.com/system/resources/previews/001/840/618/original/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg",
            width: 40,
            height: 40,
            radius: 30,
          ),
        ),
        suffixIcon: BlocConsumer<CommentsBloc, CommentsState>(
          listener: (context, state) {
            if (state is AddCommentSuccess) {
              _controller.clear();
              context.read<CommentsBloc>().add(GetCommentsEvent(propertyId));
            }
          },
          builder: (context, state) {
            if (state is AddCommentLoading) {
              return const Padding(
                padding: EdgeInsets.all(12),
                child: CircularProgressIndicator(),
              );
            } else {
              return IconButton(
                onPressed: () {
                  if (_controller.text != null && _controller.text != '') {
                    context
                        .read<CommentsBloc>()
                        .add(AddCommentEvent(propertyId, _controller.text));
                    context
                        .read<CommentsBloc>()
                        .add(GetCommentsEvent(propertyId));
                  }
                },
                icon: const Icon(
                  Icons.send,
                  color: kLightBlue,
                ),
              );
            }
          },
        ),
        hintText: 'add comment',
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.w900,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      style: const TextStyle(
        color: kDarkBlue,
      ),
    );
  }
}
