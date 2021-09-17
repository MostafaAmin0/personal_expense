import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  
  final String label;
  final Function _showDatePicker;

  const AdaptiveTextButton(this.label, this._showDatePicker);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed:()=> _showDatePicker(),
          )
        : TextButton(
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: ()=>_showDatePicker(),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
