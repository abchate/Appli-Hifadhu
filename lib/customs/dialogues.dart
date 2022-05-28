import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showErrorDialog(
    String message, BuildContext context, VoidCallback callback) {
  AwesomeDialog(
          context: context,
          animType: AnimType.TOPSLIDE,
          dialogType: DialogType.ERROR,
          headerAnimationLoop: false,
          title: 'Erreur',
          desc: message,
          btnOkIcon: Icons.check_circle,
          btnOkOnPress: callback,
          btnOkColor: Colors.redAccent,
          btnOkText: "D'accord")
      .show();
}

void showSuccesDialog(
    String message, BuildContext context, VoidCallback callback) {
  AwesomeDialog(
          context: context,
          animType: AnimType.TOPSLIDE,
          dialogType: DialogType.SUCCES,
          headerAnimationLoop: false,
          title: 'succes',
          desc: message,
          btnOkIcon: Icons.check_circle,
          btnOkOnPress: callback,
          btnOkColor: Colors.greenAccent,
          btnOkText: "D'accord")
      .show();
}
