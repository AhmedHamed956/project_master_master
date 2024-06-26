import 'package:flutter/material.dart';
import 'package:project/main.dart';

import '../../common/global.dart';
import '../Shared/constant.dart';

void showSnackBar({required String title}) {
  gloScaffMessKey.currentState?.hideCurrentSnackBar();
  gloScaffMessKey.currentState?.clearSnackBars();
  gloScaffMessKey.currentState?.showSnackBar(
      SnackBar(behavior: SnackBarBehavior.floating, content: Text(title)));
}
