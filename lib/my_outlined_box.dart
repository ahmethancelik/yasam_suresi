import 'package:flutter/material.dart';

import 'constants.dart';

class MyOutlinedButton extends StatelessWidget {
  String isaret;
  int boy;
  void Function()? onPressed;

  MyOutlinedButton({this.isaret = "", this.boy = 170, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          isaret,
          style: kMetinStili,
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.lightBlue, width: 1),
        ),
      ),
    );
  }
}
