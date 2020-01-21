import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/cupertino.dart';

showDialogue({BuildContext context, String title, String desc}) {
  EasyDialog(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
        textScaleFactor: 1.2,
      ),
      description: Text(
        desc,
        textScaleFactor: 1.1,
        textAlign: TextAlign.center,
      )).show(context);
}
