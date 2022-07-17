/*
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelPage extends StatefulWidget {
  final CounterStateModel model;

  const ScopedModelPage({super.key, required this.model});

  @override
  State<StatefulWidget> createState() => ScopedModelPageState();
}

class ScopedModelPageState extends State<ScopedModelPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterStateModel>(
      model: widget.model,
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
        ScopedModelDescendant<CounterStateModel>(
          rebuildOnChange: true,
          builder: (context, child, model) {
            return Text(
              model.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            );
          },
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _Counter(text: 'Child widget 1'),
            _Counter(text: 'Child widget 2'),
          ],
        ),
      ],
    );
  }
}

class _Counter extends StatelessWidget {
  final String text;

  _Counter({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.yellowAccent[100],
      child: Column(
        children: [
          Text(text, style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 14)),
          ScopedModelDescendant<CounterStateModel>(
            rebuildOnChange: true,
            builder: (context, child, model) =>
                Text(model.counter.toString(), style: Theme.of(context).textTheme.headline4),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ScopedModelDescendant<CounterStateModel>(
                rebuildOnChange: false,
                builder: (context, child, model) => ElevatedButton(
                  onPressed: () => model.decrement(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                  child: const Icon(Icons.remove),
                ),
              ),
              ScopedModelDescendant<CounterStateModel>(
                builder: (context, child, model) => ElevatedButton(
                  onPressed: () => model.increment(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CounterStateModel extends Model {
  int counter;

  increment() {
    counter++;
    notifyListeners();
  }

  decrement() {
    counter--;
    notifyListeners();
  }

  CounterStateModel({this.counter = 0});
}
*/