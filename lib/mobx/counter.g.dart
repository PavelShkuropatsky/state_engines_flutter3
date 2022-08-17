// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterMobx on _CounterMobx, Store {
  late final _$counterValueAtom =
      Atom(name: '_Counter.counterValue', context: context);

  @override
  int get counterValue {
    _$counterValueAtom.reportRead();
    return super.counterValue;
  }

  @override
  set counterValue(int value) {
    _$counterValueAtom.reportWrite(value, super.counterValue, () {
      super.counterValue = value;
    });
  }

  late final _$_CounterActionController =
      ActionController(name: '_Counter', context: context);

  @override
  dynamic increment() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrement() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counterValue: ${counterValue}
    ''';
  }
}
