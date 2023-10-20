import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/style/app_icons.dart';
import 'package:homy_hon/core/utils/dialog/dialog_transition_builder.dart';

class LoadingDialog {
  static final LoadingDialog _loadingDialog = LoadingDialog._internal();

  factory LoadingDialog() {
    return _loadingDialog;
  }

  LoadingDialog._internal();

  bool _isShown = false;

  void closeDialog(BuildContext context) {
    if (_isShown) {
      print("object");
      Navigator.of(context).pop();
      _isShown = false;
    }
  }

  void openDialog(BuildContext context) {
    _isShown = true;
    dialogTransitionBuilder(context, const _LoadingDialogBody())
        .whenComplete(() => _isShown = false);
  }
}

class _LoadingDialogBody extends StatelessWidget {
  const _LoadingDialogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            color: kPrimaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitThreeInOut(itemBuilder: (_, int index) {
                return SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: kBlack,
                    ));
              }),
              Text(
                "loading",
                style: TextStyle(
                  // fontFamily: appFontFamily,
                  fontSize: 16,
                  decoration: TextDecoration.none, ////set decoration to .none
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  // fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
