import 'package:flutter/material.dart';

class SetStateTab extends StatefulWidget {
  const SetStateTab({super.key});

  @override
  State<StatefulWidget> createState() => SetStateTabState();
}

class SetStateTabState extends State<SetStateTab> with AutomaticKeepAliveClientMixin {
  late int _counter;

  _increment() => _counter++;
  _decrement() => _counter--;

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Text(
          'Root widget',
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(4, 4, 4, 32),
              color: Colors.yellowAccent[100],
              child: Column(
                children: [
                  Text('Child widget 1', style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 14)),
                  Text('$_counter', style: Theme.of(context).textTheme.headline4),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() => _decrement()),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                        child: const Icon(Icons.remove),
                      ),
                      ElevatedButton(
                        onPressed: () => setState(() => _increment()),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(4.0).copyWith(bottom: 32.0),
              color: Colors.yellowAccent[100],
              child: Column(
                children: [
                  Text('Child widget 2', style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 14)),
                  Text('$_counter', style: Theme.of(context).textTheme.headline4),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() => _decrement()),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                        child: const Icon(Icons.remove),
                      ),
                      ElevatedButton(
                        onPressed: () => setState(() => _increment()),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
