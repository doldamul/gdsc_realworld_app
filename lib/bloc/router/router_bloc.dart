import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:realworld_app/bloc/router/router_event.dart';
import 'package:realworld_app/bloc/router/router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(const RouterState.init()) {
    on<PushRouteEvent>(_pushEventHandler);
    on<GoRouteEvent>(_goEventHandler);
    on<PopRouteEvent>(_popEventHandler);
  }

  void _pushEventHandler(
    PushRouteEvent event,
    Emitter<RouterState> emit,
  ) async {
    event.context.push(event.route.path);
  }

  void _goEventHandler(
    GoRouteEvent event,
    Emitter<RouterState> emit,
  ) async {
    event.context.go(event.route.path);
  }

  void _popEventHandler(
    PopRouteEvent event,
    Emitter<RouterState> emit,
  ) async {
    event.context.pop();
  }
}