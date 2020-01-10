import 'package:flutter/material.dart';
import 'frost_transition.dart';
import 'package:weather_pets/screens/city_screen.dart';


class OverlayMenu extends PopupRoute<Null>{
  static const double frostAnimationStartValue = 0.0;
  static const double frostAnimationEndValue = 20.0;

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => "Close";

  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
      new FrostTransition(
        animation: new Tween<double>(
          begin: frostAnimationStartValue,
          end: frostAnimationEndValue,
        ).animate(animation),
        child: child,
      );

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>
      new CityScreen();

}