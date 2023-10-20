import 'package:flutter/material.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/dialog/custom_dialog.dart';
import 'package:homy_hon/core/utils/dialog/dialog_transition_builder.dart';
import 'package:homy_hon/core/utils/dialog/my_customButton.dart';

class ErrorDialog {
  static void openDialog(BuildContext context, String? message) {
    dialogTransitionBuilder(
        context,
        _ErrorDialogBody(
          message: message,
        ));
  }
}

class _ErrorDialogBody extends StatelessWidget {
  const _ErrorDialogBody({Key? key, this.message}) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 60,
            ),
            child: Center(
              child: Text(
                (message == null || message!.isEmpty)
                    ? "Some_Thing_went_wrong"
                    : message!,
                style: TextStyle(color: kblue),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyCustomButton(
              label: "close",
              fillColor: kPrimaryColor,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
