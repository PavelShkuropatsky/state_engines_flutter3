import 'package:rxdart/rxdart.dart';

/// Instances for counters
final headCounter = RxCounterStore();
final rightCounter = RxCounterStore()
  ..actionSubject.listen((event) => headCounter.actionSubject.add(event));
final leftCounter = RxCounterStore()
  ..actionSubject.listen((event) => headCounter.actionSubject.add(event));

/// General counter engine class
class RxCounterStore {
  int _counter;

  /// Stream receiving increment or decrement action
  final PublishSubject<RxCounterEvent> actionSubject;
  /// Stream emitting current counter
  final PublishSubject<int> counterSubject;

  RxCounterStore({int startValue = 0})
      : _counter = startValue,
        actionSubject = PublishSubject<RxCounterEvent>(),
        counterSubject = PublishSubject<int>() {
    actionSubject.listen(_onEvent);
  }

  int get counter => _counter;

  increment() => actionSubject.add(RxIncrementEvent());
  decrement() => actionSubject.add(RxDecrementEvent());

  _onEvent(RxCounterEvent event) {
    if (event is RxIncrementEvent) counterSubject.add(++ _counter);
    if (event is RxDecrementEvent) counterSubject.add(-- _counter);
  }
}

/// Counter events classes
class RxCounterEvent {}
class RxIncrementEvent extends RxCounterEvent {}
class RxDecrementEvent extends RxCounterEvent {}