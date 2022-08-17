import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class CounterMobx = _CounterMobx with _$CounterMobx;

abstract class _CounterMobx with Store {
  @observable
  int counterValue = 0;

  @action
  increment() => counterValue ++;
  @action
  decrement() => counterValue --;
}