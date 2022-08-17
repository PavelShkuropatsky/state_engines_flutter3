import 'package:redux/redux.dart';
import 'package:state_engines_flutter3/redux/actions.dart';
import 'package:state_engines_flutter3/redux/app_state.dart';

AppState reducer(AppState state, dynamic action) =>
    AppState(
        headCounter: _headReducer(state.headCounter, action),
        rightCounter: _rightReducer(state.rightCounter, action),
        leftCounter: _leftReducer(state.leftCounter, action));

Reducer<int> _rightReducer = combineReducers(
    [
      TypedReducer<int, AddToRightAction>(_addRightReducer),
      TypedReducer<int, RemoveToRightAction>(_removeRightReducer),
    ]
);

Reducer<int> _leftReducer = combineReducers(
    [
      TypedReducer<int, AddToLeftAction>(_addLeftReducer),
      TypedReducer<int, RemoveToLeftAction>(_removeLeftReducer),
    ]
);

Reducer<int> _headReducer = combineReducers(
  [
    TypedReducer<int, AddToHeadAction>(_addHeadReducer),
    TypedReducer<int, RemoveToHeadAction>(_removeHeadReducer),
  ]
);


int _addRightReducer(int count, AddToRightAction action) => count + 1;
int _removeRightReducer(int count, RemoveToRightAction action) => count - 1;

int _addLeftReducer(int count, AddToLeftAction action) => count + 1;
int _removeLeftReducer(int count, RemoveToLeftAction action) => count - 1;

int _addHeadReducer(int count, AddToHeadAction action) => count + 1;
int _removeHeadReducer(int count, RemoveToHeadAction action) => count - 1;


/*
AppState reducer(AppState state, dynamic action) {
  if (action is AddToHeadAction) {
    return state.copyWith(headCounter: state.headCounter + 1);
  } else if (action is AddToLeftAction) {
    return state.copyWith(leftCounter: state.leftCounter + 1);
  } else if (action is AddToLeftAction) {
    return state.copyWith(rightCounter: state.rightCounter + 1);
  } else {
    return state;
  }
}
*/