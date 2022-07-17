import 'package:flutter/material.dart';

class InheritedWidgetTab extends StatefulWidget {
  InheritedWidgetTab({super.key});

  @override
  State<StatefulWidget> createState() => _InheritedWidgetTabState();
}

class _InheritedWidgetTabState extends State<InheritedWidgetTab> with AutomaticKeepAliveClientMixin {
  late int _counter;

  _incrementCounter() => setState(() => _counter++);
  _decrementCounter() => setState(() => _counter--);

  @override
  void initState() {
    _counter = 0;
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _InheritedWidget(
      state: this,
      child: _RootWidget(),
    );
  }
}

class _RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Root widget',
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          '${_InheritedWidget.of(context).state._counter}',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _Counter(text: 'Child widget 1'),
            _Counter(text: 'Child widget 2'),
          ],
        )
      ],
    );
  }
}

class _Counter extends StatelessWidget {
  final String text;

  const _Counter({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inheritedWidget = _InheritedWidget.of(context);
    return Card(
      margin: const EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.yellowAccent[100],
      child: Column(
        children: [
          Text(text, style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 14)),
          Text('${inheritedWidget.state._counter}', style: Theme.of(context).textTheme.headline4),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => inheritedWidget.state._decrementCounter(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () => inheritedWidget.state._incrementCounter(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _InheritedWidget extends InheritedWidget {
  final _InheritedWidgetTabState state;

  const _InheritedWidget({Key? key, required Widget child, required this.state}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedWidget oldWidget) =>
      state._counter != oldWidget.state._counter;

  static _InheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_InheritedWidget>()!;
}
