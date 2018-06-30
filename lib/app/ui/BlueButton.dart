import 'package:flutter/material.dart';

class BlueButton extends Container {
  final VoidCallback onPressed;
  final String title;

  BlueButton(this.title, this.onPressed);

  @override
  EdgeInsetsGeometry get margin => EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0);

  @override
  // TODO: implement alignment
  AlignmentGeometry get alignment => AlignmentDirectional.centerEnd;

  @override
  // TODO: implement child
  Widget get child =>
      FlatButton(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        onPressed: onPressed,
        child: Text(title),
        color: Colors.blue,
      );
}