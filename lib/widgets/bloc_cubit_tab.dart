import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_cubit.dart';

class BlocCubitTab extends StatefulWidget {
  const BlocCubitTab({super.key});

  @override
  State<BlocCubitTab> createState() => _BlocCubitTabState();
}

class _BlocCubitTabState extends State<BlocCubitTab> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: Scaffold(
        body: Column(
          children: [
            Text('Root widget',style: Theme.of(context).textTheme.headline4),
            Builder(
              builder: (context) {
                return BlocBuilder<CounterCubit, int>(
                  bloc: BlocProvider.of<CounterCubit>(context),
                  builder: (context, state) =>
                    Text('$state', style: Theme.of(context).textTheme.headline4)
                );
              }
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Counter(text: 'Child widget 1'),
                _Counter(text: 'Child widget 2'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  final String text;

  _Counter({
    Key? key,
    required this.text,
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
          BlocBuilder<CounterCubit, int>(
            bloc: BlocProvider.of<CounterCubit>(context, listen: true),
            builder: (context, state) =>
                Text('$state', style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => BlocProvider.of<CounterCubit>(context, listen: false).decrement(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                child: const Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () => BlocProvider.of<CounterCubit>(context, listen: false).increment(),
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
