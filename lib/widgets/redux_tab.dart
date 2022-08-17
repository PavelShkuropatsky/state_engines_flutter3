import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_engines_flutter3/redux/actions.dart';
import 'package:state_engines_flutter3/redux/reducers.dart';
import '../redux/app_state.dart';
import '../redux/middlewares.dart';

final Store<AppState> store = Store(
    reducer,
    initialState: AppState.initial(),
    middleware: middleware);

class ReduxTab extends StatelessWidget {
  const ReduxTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: Scaffold(
        body: Column(
          children: [
            Text('Root widget',style: Theme.of(context).textTheme.headline4),
            StoreConnector<AppState, String>(
                builder: (context, counterStr) => Text(counterStr, style: Theme.of(context).textTheme.headline4),
                converter: (localStore) => localStore.state.headCounter.toString(),
                distinct: true,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Counter(text: 'Child widget 1', side: CounterSide.left),
                _Counter(text: 'Child widget 2', side: CounterSide.right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum CounterSide {left, right}

class _Counter extends StatelessWidget {
  final String text;
  final CounterSide side;

  dynamic get _addAction => (_isRight ? AddToRightAction() : AddToLeftAction());
  dynamic get _removeAction => (_isRight ? RemoveToRightAction() : RemoveToLeftAction());

  bool get _isLeft => side == CounterSide.left;
  bool get _isRight => side == CounterSide.right;

  _Counter({
    Key? key,
    required this.text,
    required this.side
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> _store = StoreProvider.of<AppState>(context);
    return Card(
      margin: const EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.yellowAccent[100],
      child: Column(
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontSize: 14)),
          StoreConnector<AppState, String>(
              builder: (context, counterStr) => Text(counterStr, style: Theme.of(context).textTheme.headline4),
              converter: (localStore) => (_isRight ? localStore.state.rightCounter
                                                   : localStore.state.leftCounter).toString(),
              distinct: true,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _store.dispatch(_removeAction),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () => _store.dispatch(_addAction),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
