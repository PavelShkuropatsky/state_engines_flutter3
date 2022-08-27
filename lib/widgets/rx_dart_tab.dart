import 'package:flutter/material.dart';
import 'package:state_engines_flutter3/rxdart/counter.dart';

class RxDartTab extends StatefulWidget {
  const RxDartTab({Key? key}) : super(key: key);

  @override
  State<RxDartTab> createState() => _RxDartTabState();
}

class _RxDartTabState extends State<RxDartTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Text("Root widget", style: Theme
                  .of(context)
                  .textTheme
                  .headline4),
              StreamBuilder(
                  initialData: headCounter.counter,
                  stream: headCounter.counterSubject,
                  builder: (context, snapshot) =>
                      Text("${snapshot.data}", style: Theme
                          .of(context)
                          .textTheme
                          .headline4)
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _Counter(text: "Child widget 1", counterStore: leftCounter),
                  _Counter(text: "Child widget 2", counterStore: rightCounter),
                ],
              ),
            ]
        )
    );
  }
}

class _Counter extends StatelessWidget {
  final String text;
  final RxCounterStore counterStore;

  const _Counter({
    Key? key,
    required this.text,
    required this.counterStore
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4).copyWith(bottom: 32),
      color: Colors.yellowAccent[100],
      child: Column(
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontSize: 14)),
          StreamBuilder(
            initialData: counterStore.counter,
            stream: counterStore.counterSubject,
            builder: (context, snapshot) =>
              Text('${snapshot.data}', style: Theme.of(context).textTheme.headline4),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => counterStore.decrement(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () => counterStore.increment(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
                child: const Icon(Icons.add),
              )
            ],
          ),
        ]
      )
    );
  }
}
