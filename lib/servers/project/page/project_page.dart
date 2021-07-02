
import 'package:QiYang/servers/common/bloc/tab/tab_selector_bloc.dart';
import 'package:QiYang/servers/common/widget/tab/tab_selector_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TabSelectorBloc tabSelectorBloc = BlocProvider.of<TabSelectorBloc>(context);

    return Scaffold(
      bottomNavigationBar: TabSelectorWidget(
          items: tabSelectorBloc.tabItems,
          currentIndex: tabSelectorBloc.state),
      body: Text('Project'),
    );
  }

}