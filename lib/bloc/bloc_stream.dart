import 'dart:async';

enum CounterEvent { decrementEvent, incrementEvent}

class CounterBloc {
  int _counter = 0;

  _increment() => _counter ++;
  _decrement() => _counter --;

  final _inputEventController = StreamController<CounterEvent>();
  final _headOutputStateController = StreamController<int>();
  final _rightBodyOutputStateController = StreamController<int>();
  final _leftBodyOutputStateController = StreamController<int>();

  StreamSink<CounterEvent> get inputEventSink => _inputEventController.sink;
  Stream<int> get headOutputStateStream => _headOutputStateController.stream;
  Stream<int> get rightBodyOutputStateStream => _rightBodyOutputStateController.stream;
  Stream<int> get leftBodyOutputStateStream => _leftBodyOutputStateController.stream;

  _mapEventToState(CounterEvent event) {
    switch (event) {
      case CounterEvent.incrementEvent:
        _increment();
        break;
      case CounterEvent.decrementEvent:
        _decrement();
        break;
      default:
    }
    _headOutputStateController.sink.add(_counter);
    _rightBodyOutputStateController.sink.add(_counter);
    _leftBodyOutputStateController.sink.add(_counter);
  }

  CounterBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  dispose() {
    _inputEventController.close();
    _headOutputStateController.close();
    _rightBodyOutputStateController.close();
    _leftBodyOutputStateController.close();
  }
}