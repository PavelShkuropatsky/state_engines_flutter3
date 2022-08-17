import 'package:redux/redux.dart';
import 'package:state_engines_flutter3/redux/actions.dart';
import 'package:state_engines_flutter3/redux/app_state.dart';

final List<Middleware<AppState>> middleware = [
  TypedMiddleware<AppState, AddToLeftAction>(addToHeadMiddleware),
  TypedMiddleware<AppState, AddToRightAction>(addToHeadMiddleware),
  TypedMiddleware<AppState, RemoveToLeftAction>(removeToHeadMiddleware),
  TypedMiddleware<AppState, RemoveToRightAction>(removeToHeadMiddleware),
];

void addToHeadMiddleware (
  Store<AppState> localstore,
  dynamic action,
  NextDispatcher next
) {
  localstore.dispatch(AddToHeadAction());
  next(action);
}

void removeToHeadMiddleware (
  Store<AppState> localstore,
  dynamic action,
  NextDispatcher next
) {
  localstore.dispatch(RemoveToHeadAction());
  next(action);
}