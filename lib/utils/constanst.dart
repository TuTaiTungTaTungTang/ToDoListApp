import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

///
import '../../utils/strings.dart';
import '../../main.dart';

/// Empty Title & Subtitle TextFields Warning
emptyFieldsWarning(context) {
  return Fluttertoast.showToast(
    msg: MyString.oopsMsg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

/// Nothing Enter When user tries to edit the current task
nothingEnterOnUpdateTaskMode(context) {
  return Fluttertoast.showToast(
    msg: MyString.oopsMsg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

/// No task Warning Dialog
dynamic warningNoTask(BuildContext context) {
  return PanaraInfoDialog.showAnimatedGrow(
    context,
    title: MyString.oopsMsg,
    message:
        "There is no Task For Delete!\n Try adding some and then try to delete it!",
    buttonText: "Okay",
    onTapDismiss: () {
      Navigator.pop(context);
    },
    panaraDialogType: PanaraDialogType.warning,
  );
}

/// Delete All Task Dialog
dynamic deleteAllTask(BuildContext context) {
  return PanaraConfirmDialog.show(
    context,
    title: MyString.areYouSure,
    message:
        "Do You really want to delete all tasks? You will no be able to undo this action!",
    confirmButtonText: "Yes",
    cancelButtonText: "No",
    onTapCancel: () {
      Navigator.pop(context);
    },
    onTapConfirm: () {
      BaseWidget.of(context).dataStore.box.clear();
      Navigator.pop(context);
    },
    panaraDialogType: PanaraDialogType.error,
    barrierDismissible: false,
  );
}

/// Lottie asset address
String lottieURL = 'assets/lottie/1.json';
