import 'package:flutter/cupertino.dart';

import '../../../../constants/constants/constant.dart';


List<BoxShadow> shadowList(){
  return [
    BoxShadow(
        offset: Offset(2, 0),
        color: Constants.dropShadowColor,
        blurRadius: 4),
    BoxShadow(
        offset: Offset(2, -2),
        color: Constants.dropShadowColor,
        blurRadius: 6),
    BoxShadow(
        offset: Offset(-2, -2),
        color: Constants.greyColor.withOpacity(0.1),
        blurRadius: 6),
    BoxShadow(
        offset: Offset(-2, 0),
        color: Constants.innerShadowColor,
        blurRadius: 6)
  ];
}