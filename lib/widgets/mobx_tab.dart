import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_engines_flutter3/mobx/counter.dart';

class MobxTab extends StatefulWidget {
  const MobxTab({super.key});

  @override
  State<MobxTab> createState() => _MobxTabState();
}

class _MobxTabState extends State<MobxTab> with AutomaticKeepAliveClientMixin {
  final counterMobx = CounterMobx();

  @override
  bool get wantKeepAlive => true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late final ReactionDisposer evenNumberReaction;

  @override
  void initState() {
    super.initState();
    evenNumberReaction = autorun((_) {
      if (counterMobx.counterValue % 2 == 0 && scaffoldKey.currentContext != null) {
        ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text("Чётное число"),
            duration: Duration(milliseconds: 100),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    evenNumberReaction();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Provider<CounterMobx>(
      create: (_) => counterMobx,
      child: Scaffold(
          key: scaffoldKey,
          body: Column(children: [
            Text("Root widget", style: Theme.of(context).textTheme.headline4),
            Observer(
                builder: (_) =>
                    Text(counterMobx.counterValue.toString(), style: Theme.of(context).textTheme.headline4)),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_Counter(text: 'ChildWidget 1'), _Counter(text: 'ChildWidget 2')],
            )
          ])),
    );
  }
}

class _Counter extends StatelessWidget {
  final String text;

  const _Counter({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final counterMobx = Provider.of<CounterMobx>(context);

    return Card(
        margin: const EdgeInsets.fromLTRB(4, 4, 4, 32),
        color: Colors.yellowAccent[100],
        child: Column(children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 14),
          ),
          Observer(
            builder: (_) => Text(counterMobx.counterValue.toString(), style: Theme.of(context).textTheme.headline4),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: counterMobx.decrement,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: counterMobx.increment,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
                child: const Icon(Icons.add),
              ),
            ],
          )
        ]));
  }
}
