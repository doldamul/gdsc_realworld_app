import 'package:flutter/material.dart';
import 'package:realworld_app/constants/routes.dart';

interface class RouterEvent {
  const RouterEvent();
}

class GoRouteEvent extends RouterEvent {
  final BuildContext context;
  final Routes route;

  const GoRouteEvent(
    this.context,
    this.route,
  );
}

class PushRouteEvent extends RouterEvent {
  final BuildContext context;
  final Routes route;

  const PushRouteEvent(
    this.context,
    this.route,
  );
}

class PopRouteEvent extends RouterEvent {
  final BuildContext context;

  const PopRouteEvent(
    this.context,
  );
}