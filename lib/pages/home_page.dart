import 'package:flutter/material.dart';
import '../widgets/bloc_cubit_tab.dart';
import '../widgets/bloc_stream_tab.dart';
import '../widgets/inherited_widget_tab.dart';
import '../widgets/provider_tab.dart';
import '../widgets/scoped_model_tab.dart';
import '../widgets/set_state_tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const SetStateTab(),
            InheritedWidgetTab(),
            //ScopedModelPage(model: CounterStateModel()),
            ProviderTab(),
            BlocStreamTab(),
            BlocCubitTab()
          ],
        ),
      ),
    );
  }

}