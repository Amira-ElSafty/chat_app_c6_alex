import 'package:flutter/material.dart';

void showLoading(BuildContext context, String message, {bool isCanceled = false }) {
  showDialog(
      barrierDismissible: isCanceled,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message),
              )
            ],
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(
  BuildContext context,
  String message,
  String posActionText,
   Function posAction, {
        String? negActionText = null,
  Function? negAction = null,
}) {
  showDialog(context: context, builder: (context){
    return AlertDialog(
      content: Text(message),
      actions: [
        TextButton(onPressed: (){
          posAction(context);
        }, child: Text(posActionText)),
      ],
    );
  });
}
