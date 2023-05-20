import 'package:flutter/material.dart';
import './institution_mobile.dart';
import './institution_desktop.dart';
import 'models/institution.dart';
import 'services/institution_service.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 810) {
      // Return SearchBarContainer() pentru telefoane
      return Column(
        children: <Widget>[
          InstitutionMobile(),
        ],
      );
    } else {
      // Return Institution() pentru desktop
       return Column(
        children: <Widget>[
          InstitutionDesktop(),
        ],
      );
    }
  }
}