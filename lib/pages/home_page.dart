import 'package:flutter/material.dart';
import 'package:state_engines_flutter3/widgets/mobx_tab.dart';
import 'package:state_engines_flutter3/widgets/redux_tab.dart';
import '../widgets/bloc_cubit_tab.dart';
import '../widgets/bloc_stream_tab.dart';
import '../widgets/inherited_widget_tab.dart';
import '../widgets/provider_tab.dart';
import '../widgets/set_state_tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Управление состоянием'),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: 'setState(Vanilla)'),
              Tab(text: 'InheritedWidget'),
              //Tab(text: 'ScopedModel'),
              Tab(text: 'Provider'),
              Tab(text: 'Bloc Stream'),
              Tab(text: 'Bloc Cubit'),
              Tab(text: 'Mobx'),
              Tab(text: 'Redux'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SetStateTab(),
            InheritedWidgetTab(),
            //ScopedModelPage(model: CounterStateModel()),
            ProviderTab(),
            BlocStreamTab(),
            BlocCubitTab(),
            MobxTab(),
            ReduxTab(),
          ],
        ),
      ),
    );
  }

}