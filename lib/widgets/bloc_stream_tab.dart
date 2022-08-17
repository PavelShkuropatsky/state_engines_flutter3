import 'package:flutter/material.dart';

import '../bloc/bloc_stream.dart';

class BlocStreamTab extends StatefulWidget {
  const BlocStreamTab({super.key});

  @override
  State<StatefulWidget> createState() => BlocStreamTabState();
}

class BlocStreamTabState extends State<BlocStreamTab> with AutomaticKeepAliveClientMixin {
  final CounterBloc _bloc = CounterBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Root widget',
            style: Theme.of(context).textTheme.headline4,
          ),
          StreamBuilder<int>(
            stream: _bloc.headOutputStateStream,
            initialData: 0,
            builder: (context, snapshot) {
              return Text(
                '${snapshot.data ?? 0}',
                style: Theme.of(context).textTheme.headline4,
              );
            }
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StreamBuilder<int>(
                stream: _bloc.leftBodyOutputStateStream,
                builder: (context, snapshot) {
                  return _Counter(
                    text: 'Child widget 1',
                    counter: snapshot.data ?? 0,
                    callbackIncr: () => _bloc.inputEventSink.add(CounterEvent.incrementEvent),
                    callbackDecr: () => _bloc.inputEventSink.add(CounterEvent.decrementEvent),
                  );
                }
              ),
              StreamBuilder<int>(
                stream: _bloc.rightBodyOutputStateStream,
                builder: (context, snapshot) {
                  return _Counter(
                    text: 'Child widget 2',
                    counter: snapshot.data ?? 0,
                    callbackIncr: () => _bloc.inputEventSink.add(CounterEvent.incrementEvent),
                    callbackDecr: () => _bloc.inputEventSink.add(CounterEvent.decrementEvent),
                  );
                }
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  String text;
  int counter;
  void Function()? callbackIncr;
  void Function()? callbackDecr;

  _Counter({
    Key? key,
    required this.text,
    required this.counter,
    this.callbackIncr,
    this.callbackDecr
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Text('$counter',
              style: Theme.of(context).textTheme.headline4),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => (callbackIncr != null ? callbackDecr!() : null),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () => (callbackIncr != null ? callbackIncr!() : null),
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
