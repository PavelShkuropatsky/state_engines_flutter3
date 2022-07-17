import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTab extends StatefulWidget {
  @override
  State<ProviderTab> createState() => _ProviderTabState();
}

class _ProviderTabState extends State<ProviderTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<CountProvider>(
      create: (BuildContext context) => CountProvider(),
      child: Builder(builder: (context) {
        return Column(
          children: [
            Text(
              'Root widget',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '${Provider.of<CountProvider>(context,listen: true).counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Counter(
                  text: 'Child widget 1',
                ),
                _Counter(
                  text: 'Child widget 2',
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

class _Counter extends StatelessWidget {
  final String text;

  const _Counter({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.yellowAccent[100],
      child: Column(
        children: [
          Text(text, style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 14)),
          Consumer<CountProvider>(
            builder: (context, value, child) => Text('${value.counter}', style: Theme.of(context).textTheme.headline4),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Provider.of<CountProvider>(context, listen: false)._decrementCounter(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                child: const Icon(Icons.remove),
              ),
              // with consumer
              ElevatedButton(
                onPressed: () => Provider.of<CountProvider>(context, listen: false)._incrementCounter(),
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

class CountProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void _incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void _decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
