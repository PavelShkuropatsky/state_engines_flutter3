import 'package:flutter/material.dart';
import 'package:state_engines_flutter3/widgets/mobx_tab.dart';
import 'package:state_engines_flutter3/widgets/redux_tab.dart';
import 'package:state_engines_flutter3/widgets/rx_dart_tab.dart';
import '../widgets/bloc_cubit_tab.dart';
import '../widgets/bloc_stream_tab.dart';
import '../widgets/inherited_widget_tab.dart';
import '../widgets/provider_tab.dart';
import '../widgets/set_state_tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Управление состоянием'),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: 'RxDart'),
              Tab(text: 'Redux'),
              Tab(text: 'Mobx'),
              Tab(text: 'Bloc Cubit'),
              Tab(text: 'Bloc Stream'),
              Tab(text: 'Provider'),
              //Tab(text: 'ScopedModel'),
              Tab(text: 'InheritedWidget'),
              Tab(text: 'setState(Vanilla)'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RxDartTab(),
            ReduxTab(),
            MobxTab(),
            BlocCubitTab(),
            BlocStreamTab(),
            ProviderTab(),
            //ScopedModelPage(model: CounterStateModel()),
            InheritedWidgetTab(),
            SetStateTab(),
          ],
        ),
      ),
    );
  }

}