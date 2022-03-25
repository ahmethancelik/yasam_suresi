import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class GenderWidget extends StatelessWidget {
  final String cinsiyet;
  final IconData cinsiyetIkonu;

  GenderWidget(
      {this.cinsiyet = "KADIN", this.cinsiyetIkonu = FontAwesomeIcons.venus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cinsiyetIkonu,
          size: 50,
          color: Colors.black54,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          style: kMetinStili,
        )
      ],
    );
  }
}
